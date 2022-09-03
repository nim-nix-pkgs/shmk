# + /media/user/Files/dev/nim/mk/src/core/relative.nim * 
#[ region [  B l a c k  ]
    Nim project
    Workspace name: mk
    Workspace direcory: /media/user/Files/dev/nim/mk/src/core/relative.nim
    Created at: 11/27/2020 10:15:28 AM
    Modified at: 11/27/2020 17:54:41 PM
endregion ]#

func relative*(path: string): string =
    if path[0] == '/' or path[0..1] == "./":
        result = path
    else:
        result = "./" & path

func isDir*(path: string): bool =
    result = false

    if path[path.len - 1] == '/':
        result = true
