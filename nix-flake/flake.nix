{
  description = "nixos-open-base-flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-25.11";
    delta-shell.url = "github:hezaki/delta-shell";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Astal/Niri/Ags
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal_niri = {
      url = "github:sameoldlab/astal?ref=feat/niri";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal_niri";
    };
  
  };
  

  outputs = { 
    self
  , nixpkgs
  , astal
  ,astal_niri
  , ags
  , home-manager
  , ... }@inputs:
  
  
  let
    system = "x86_64-linux"; 
    curversion = "25.05";
    #curversion = "25.11";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
      overlays = [
        (final: prev: {
          over-lutris = (import ./overlays/lutris.nix { inherit pkgs; });
        })
      ];
    };
  in {
    nixosConfigurations.eenymeenyminymoe = inputs.nixpkgs.lib.nixosSystem {
      inherit pkgs;
      specialArgs = {
        inherit inputs system curversion;
      };
      modules = [
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager
        { 
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.lagavulin = import (./. + "/home/home.nix") ;
            extraSpecialArgs = { inherit curversion inputs; };
          };
        }
      ];
    };
  };
}