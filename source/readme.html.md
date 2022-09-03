<!-- + .../mk/readme.html.md * -->
<!-- region [  B l a c k  ]
    Md project
    Workspace name: mk
    Workspace direcory: .../mk/readme.md
    Created at: 11/27/2020 19:08:57
    Modified at: 11/27/2020 22:16:28 PM
endregion -->

<style>
    .bash-code {
        font-size: 1rem;
        color: #ffffff;
        background-color: black;
        padding: 10px;
        border-radius: 6px;
    }
    .bash-code span.command {
        color: #c48fd4;
    }
    .bash-code span.args {
        color: #72bbf9;
    }
    .bash-code span.string {
        color: #fdc2c2;
    }
    .bash-code span.scope {
        color: #00a6b2;
    }
    .bash-code span.return {
        color: #ffffff;
        line-height: 1.2rem;
    }
    .bash-code span.folder {
        background-color: #c3e88d;
        border-radius: 2px;
    }
    .bash-code span.file {
        color: #c3e88d;
    }
</style>

# **MK - A smart file/folder creator**

---

**Requirements**

The only requirement is the language in which this script was written

[Nim lang](https://nim-lang.org/)

---

**Instalation**

<div class="bash-code">
$
<span class="command">cd</span>
<span class="args">mk/</span>

$
<span class="command">nimble</span>
<span class="args">build</span>

$
<span class="command">mv</span>
<span class="args">./index ./mk</span>

</div>

You can copy the mk to your bin folder!

<!--
<div class="bash-code">
</div>
<span class="file"></span>
<span class="folder"></span>
<span class="scope"></span>
<span class="args"></span>
<span class="command"></span>
-->

---

**Usage**

| Command     | Command description                       |
| ----------- | ----------------------------------------- |
| --reset, -r | Resets the storaged latest directory      |
| --clean, -c | Clean outpup for use the latest directory |

---

Examples:

<div class="bash-code">
$ <span class="command">mk</span> <span class="args">project/ .gitignore src/ index.html script.js style.css includes/ index.js</span>
</div>

Returns a tree view of created files and folders and the latest folder:

<div class="bash-code">
./project/:<br>
&nbsp;&nbsp;&nbsp;&nbsp;.gitignore<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;./project/src/:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;index.html<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;script.js<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;style.css<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;./project/src/includes/:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;index.js<br><br>
./project/src/includes/
</div>
&nbsp;

---

**You can use the latest directory for cd to dir**

Example on bash:

<div class="bash-code">
~/$
<span class="command">cd</span>
<span class="scope">$(</span><span class="command">mk</span>
<span class="args">server/ build/../ readme.md src/ server.ts core/ index.ts ../public/ index.html index.css script.js</span> -c<span class="scope">)</span>
<br>
~/server/src/public/$
<span class="command">cd</span>
<span class="args">../../</span>

~/server/$
<span class="command">exa</span>
-a -T

<span class="return">
.:<br>
<span class="folder">build</span>/
<span class="file">readme.md*</span>
<span class="folder">src</span>/<br><br>

./build:<br><br>

./src:<br>

<span class="folder">core</span>/
<span class="folder">public</span>/
<span class="file">server.ts\*</span><br><br>

./src/core:<br>
<span class="file">index.ts\*</span><br><br>

./src/public:<br>
<span class="file">
index.css*
index.html*
script.js\*
</span><br>
</span><br>

~/server/$

</div>

Or on fish:

<div class="bash-code">
~/$
<span class="command">cd</span>
<span class="scope">(</span><span class="command">mk</span>
<span class="args">ui/ ui.nimble src/ ui.nim -r ui/readme.md</span> -c<span class="scope">)</span>
<br>
~/ui/src/$
<span class="command">cd</span>
<span class="args">../</span>

~/ui/$
<span class="command">exa</span>
-a -T

<span class="return">
.:<br>
<span class="file">readme.md*</span>
<span class="folder">src</span>/
<span class="file">ui.nimble*</span><br><br>

./src:<br>

<span class="file">ui.nim\*</span><br><br>

~/ui/$

</div>

---
