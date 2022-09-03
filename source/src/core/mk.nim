# + /media/user/Files/dev/nim/mk/src/core/mk.nim * 
#[ region [  B l a c k  ]
    Nim project
    Workspace name: mk
    Workspace direcory: /media/user/Files/dev/nim/mk/src/core/mk.nim
    Created at: 11/27/2020 10:15:28 AM
    Modified at: 11/27/2020 17:59:57 PM
endregion ]#

import os, strformat, strutils, sequtils, sugar, distros

type
    Commands = object
        dir: string
        file: string


var mkCommands = Commands(dir: "mkdir", file: "touch")


if detectOs(Windows):
    mkCommands = Commands(dir: "mkdir", file: "echo >>") # copy NUL # remove file

proc mk*(inputpath: string): string =
    ##  AutoFs; A smart file/folder manipulation

    if inputpath == "" or inputpath[0] == '.' and inputpath.len < 3:
        return "./"

    result = "./"

    let pathSplit = os.splitFile(inputpath)
    let filepath = pathSplit.dir
    let filename = pathSplit.name & pathSplit.ext

    if filepath != "":
        let folders = filepath.split("/")
        var currentFolder = ""

        if folders[0] == "":
            currentFolder = "/"

        for folder in folders.filter(x => x != ""):
            currentFolder = strformat.fmt"{currentFolder}{folder}/"

            if folder == ".":
                continue

            let exists = os.dirExists(currentFolder)

            if not exists:
                discard os.
                    execShellCmd(strformat.fmt"{mkCommands.dir} {currentFolder}")

    var newFilename = ""

    if filename != "":
        if filepath == "":
            newFilename = filename
        else:
            newFilename = strformat.fmt"{filepath}/{filename}"

        let exists = os.fileExists(newFilename)

        if not exists:
            discard os.execShellCmd(strformat.fmt"{mkCommands.file} {newFilename}")

    result = filepath & "/"
