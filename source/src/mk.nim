# + /media/user/Files/dev/nim/mk/src/mk.nim * 
#[ region [  B l a c k  ]
    Nim project
    Workspace name: mk
    Workspace direcory: /media/user/Files/dev/nim/mk/src/mk.nim
    Created at: 11/27/2020 10:15:28 AM
    Modified at: 11/29/2020 19:34:43 PM
endregion ]#


import os, strformat, system

import core/mk,
       core/file,
       core/tree

proc main (args: seq[string]): string =
    ## Smart file and directory creator
    ##
    ## Params:
    ##     --clean or -c: clean output
    ##     --reset or -r: reset the dir
    ##
    ## **Example:**
    ## .. code-block:: nim
    ##   main(@["dir/to/new/folder/file1.ext", "file2.ext", "-r", "my/new/path/"]) # Creates all folders and file then returns the last folder;
    ##
    ## Result: dir/to/new/folder/: file1.ext, file2.ext;
    ##         my/new/path/: treeView

    var config: seq[string] = @[]
    var folder = ""

    var files: seq[string] = @[]

    for arg in args:

        if arg[0] == '-':
            config.add(arg)
        else:
            var tmpFolder = "./"
            var path = "";

            if config.contains("--reset") or config.contains("-r"):
                path = arg
                if config.contains("--reset"):
                    config.delete(config.find("--reset"))
                else:
                    config.delete(config.find("-r"))

            else:
                path = strformat.fmt"{folder}{arg}"

            let okFile = file.relative(path)

            files.add(okFile)
            tmpFolder = mk.mk(okFile)

            if tmpFolder != "": folder = tmpFolder

    if not (config.contains("--clean") or config.contains("-c")):
        echo treeView(files)

    result = folder

when isMainModule:
    let res = main(os.commandLineParams())

    if res != "":
        echo res
    else:
        system.quit(1)
