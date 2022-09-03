# + /media/user/Files/dev/nim/mk/src/core/tree.nim * 
#[ region [  B l a c k  ]
    Nim project
    Workspace name: mk
    Workspace direcory: /media/user/Files/dev/nim/mk/src/core/tree.nim
    Created at: 11/27/2020 11:52:46 AM
    Modified at: 11/27/2020 18:00:37 PM
endregion ]#

import strutils

import file

const identationSize = 4
const identationChar = ' '

proc getIdent (identationChar: char, identationSize: Natural,
        identation: Natural): string =
    result = identationChar.repeat(identationSize * identation)

func treeView*(inputPaths: seq[string]): string =

    var identation: Natural = 0
    var lastPathSize: Natural = 0

    var lastDir = "./"

    for path in inputPaths:
        let parts = file.relative(path).split("/")

        if lastPathSize != 0:
            var addToIdentation = parts.len - lastPathSize

            if addToIdentation < 0:
                addToIdentation = 0

            identation += addToIdentation

        var dir = "./"
        var file = ""

        for part in parts:
            if part == "." or # if part is first or last
                part == "":
                    continue

            if part == parts[parts.len - 1]: # if this index is a file
                file = part & "\n"
                continue

            dir &= part & "/"

        if file != "":
            if dir != lastDir:
                result &=
                "\n" &
                getIdent(identationChar, identationSize, identation) &
                dir &
                ":\n" &
                getIdent(identationChar, identationSize, identation + 1) &
                file
            else:
                result &=
                getIdent(identationChar, identationSize, identation + 1) &
                file

            lastDir = dir


        lastPathSize = parts.len

