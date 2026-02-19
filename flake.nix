{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixcord.url = "github:FlameFlag/nixcord";
    nvim_nixos.url = "github:zarinetta/nvim_nixos";
    home-manager = {
    url = "github:nix-community/home-manager/release-25.11";
    inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixcord, nvim_nixos, ... }@inputs: {
    nixosConfigurations = {
    nixos = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
    ./configuration.nix
    home-manager.nixosModules.home-manager
    
   { nixpkgs.overlays = [
     nvim_nixos.overlays.default ];
   }
    
    {
     home-manager.useGlobalPkgs = true;
     home-manager.useUserPackages = true;
     home-manager.backupFileExtension = "hm-backup";
     home-manager.extraSpecialArgs = { inherit inputs; };

     home-manager.users.zarinetta = import ./home.nix;
      }
      ];
      };
    };
  };
}
