<!-- + .../mk/readme.md * -->
<!-- region [  B l a c k  ]
    Md project
    Workspace name: mk
    Workspace direcory: .../mk/readme.md
    Created at: 11/27/2020 22:00:57
    Modified at: 11/29/2020 23:57:38 PM
endregion -->

# **MK - A smart file/folder creator**

---

**Requirements**

The only requirement is the language in which this script was written

[Nim lang](https://nim-lang.org/)

---

**Instalation**

Using nim package manager (nimble):

```bash
$ nimble install shmk
```

Or manually:

```bash
$ cd mk/

$ nimble build
```

</div>

You can copy the mk to your bin folder!

---

**Usage**

| Command     | Command description                       |
| ----------- | ----------------------------------------- |
| --reset, -r | Resets the storaged latest directory      |
| --clean, -c | Clean outpup for use the latest directory |

---

Examples:

```bash
$ mk project/ .gitignore src/ index.html script.js style.css includes/ index.js
```

Returns a tree view of created files and folders and the latest folder:

```bash
./project/:
    .gitignore

    ./project/src/:
        index.html
        script.js
        style.css

        ./project/src/includes/:
            index.js

./project/src/includes/
```

---

**You can use the latest directory for cd to dir**

Example on bash:

```bash
~/$ cd $(mk server/ build/../ readme.md src/ server.ts core/ index.ts ../public/ index.html index.css script.js -c)

~/server/src/public/$ cd ../../

~/server/$ ls -R

.:
build/
readme.md*
src/

./build:

./src:

core/
public/
server.ts*

./src/core:
index.ts*

./src/public:

index.css*
index.html*
script.js*

~/server/$
```

Or on fish:

```bash
~/$ cd (mk ui/ ui.nimble src/ ui.nim -r ui/readme.md -c)

~/ui/src/$ cd ../

~/ui/$ ls -R

.:
readme.md*
src/
ui.nimble*

./src:

ui.nim*

~/ui/$
```

---
