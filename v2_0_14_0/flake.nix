{
  description = ''Wrapper of the SDL 2 library for the Nim language.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-sdl2-v2_0_14_0.flake = false;
  inputs.src-sdl2-v2_0_14_0.ref   = "refs/tags/v2.0.14.0";
  inputs.src-sdl2-v2_0_14_0.owner = "Vladar4";
  inputs.src-sdl2-v2_0_14_0.repo  = "sdl2_nim";
  inputs.src-sdl2-v2_0_14_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-sdl2-v2_0_14_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-sdl2-v2_0_14_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}