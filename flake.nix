{
  description = "A basic flake for helm chart development";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , utils
    , nixpkgs
    , ...
    } @ inputs:
    utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    rec {
      devShell = pkgs.mkShell {
        shellHook = ''
          export KUBECONFIG="''${PWD}/.kube/config"
        '';
        buildInputs = with pkgs; [
          kubectl
          kubernetes-helm
        ];
      };
    });
}
