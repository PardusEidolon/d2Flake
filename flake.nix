{
  description = "A d2 flake";
  inputs = {
   flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
   flake-utils.lib.eachDefaultSystem (
    system: let
     pkgs = nixpkgs.legacyPackages.${system};
     dev  = with pkgs;
     mkShell {
	name = "d2 dev shell";
	buildInputs = with pkgs; [d2];
      };
    in
     {
       formatter = with pkgs; alejandra;
       devShells.default = dev;
     }
    );
}
