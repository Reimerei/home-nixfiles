{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {home-manager, ...}: {
    nixosModules.default = {
      imports = [
        home-manager.nixosModules.home-manager
        ./home.nix
      ];
    };

    darwinModules.default = {lib, ...}: {
      imports = [
        home-manager.darwinModules.home-manager
        ./home.nix
      ];

      home-manager.users.reimerei.home = {
        homeDirectory = lib.mkForce "/Users/reimerei";
      };
    };
  };
}
