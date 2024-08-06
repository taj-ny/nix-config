{
  description = "❄️ My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    hardware.url = "github:nixos/nixos-hardware";
    impermanence.url = "github:nix-community/impermanence";
    nix-colors.url = "github:misterio77/nix-colors";

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

    kwin-effects-forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur/develop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kwin-effects-startupfeedback-busy-cursor = {
      url = "github:taj-ny/kwin-effects-startupfeedback-busy-cursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = {
    self,
    hardware,
    home-manager,
    lanzaboote,
    nixpkgs,
    nix-colors,
    plasma-manager,
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
    nixosModules = import ./nixos/modules;
    homeManagerModules = import ./home/modules;

    nixosConfigurations = {
      andromeda = lib.nixosSystem {
        modules = [ ./nixos/config/andromeda ];
        specialArgs = { inherit inputs outputs nix-colors; };
      };

      thinkpad = lib.nixosSystem {
        modules = [ ./nixos/config/thinkpad ];
        specialArgs = { inherit inputs outputs nix-colors; };
      };

      vm = lib.nixosSystem {
        modules = [ ./nixos/config/vm ];
        specialArgs = { inherit inputs outputs nix-colors; };
      };
    };
  };
}
