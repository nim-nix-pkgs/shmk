{
  description = ''Smart file/folder creation'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-mk-master.flake = false;
  inputs.src-mk-master.ref   = "refs/heads/master";
  inputs.src-mk-master.owner = "thisNimAgo";
  inputs.src-mk-master.repo  = "mk";
  inputs.src-mk-master.type  = "gitlab";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-mk-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-mk-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}