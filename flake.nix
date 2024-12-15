{
  description = "Home Manager configuration of berkan";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, plasma-manager, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      modules_base = [ ./home.nix plasma-manager.homeManagerModules.plasma-manager nixvim.homeManagerModules.nixvim ];
    in
    {
      homeConfigurations."berkan@morpheus" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = modules_base ++ [{home.packages = (import ./pkgs/nuc.nix { inherit pkgs; });}];
      };

      homeConfigurations."berkan" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = modules_base ++ [{home.packages = (import ./pkgs/all.nix { inherit pkgs; });}];
      };
    };
}
