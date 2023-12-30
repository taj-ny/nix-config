{
  description = "Nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    hardware.url = "github:nixos/nixos-hardware";
    impermanence.url = "github:nix-community/impermanence";

    firefox-ui-fix = {
      url = "github:black7375/Firefox-UI-Fix/photon-style";
      flake = false;
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    hardware,
    home-manager,
    lanzaboote,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;

    lib = nixpkgs.lib // home-manager.lib;
    systems = [ "x86_64-linux" ];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (system: import nixpkgs {
      inherit system;

      config.allowUnfree = true;
    });
  in
  rec {
    inherit lib;

    packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
    devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
    overlays = import ./overlays { inherit inputs; };
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      andromeda = lib.nixosSystem {
        modules = [ ./nixos/andromeda.nix ];
        specialArgs = { inherit inputs outputs; };
      };

      thinkpad = lib.nixosSystem {
        modules = [ ./nixos/thinkpad ];
        specialArgs = { inherit inputs outputs; };
      };
    };

    homeConfigurations = {
      "marcin@andromeda" = lib.homeManagerConfiguration {
        modules = [ ./home/marcin/andromeda.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };

      "marcin@thinkpad" = lib.homeManagerConfiguration {
        modules = [ ./home/marcin/thinkpad.nix ];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
    };
  };
}
