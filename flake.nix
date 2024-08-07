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
      url = "github:nix-community/lanzaboote/v0.4.1";
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
    home-manager,
    nixpkgs,
    nix-colors,
    ...
  } @ inputs: let
    inherit (self) outputs;

    lib = nixpkgs.lib.extend (_: _: import ./lib { pkgs = nixpkgs; });
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

    nixosConfigurations =
      lib.listToAttrs (
        lib.mapAttrsToList (name: value: {
          inherit name;

          value = lib.nixosSystem {
            specialArgs = { inherit inputs outputs nix-colors; };

            lib = lib.extend (_: _: import ./lib {
              pkgs = import nixpkgs {
                system = value;
              };
            });

            modules = [
              ./nixos/config/common/global
              ./nixos/config/${name}

              {
                networking.hostName = name;
              }
            ];
          };
        }) {
          andromeda = "x86_64-linux";
          thinkpad = "x86_64-linux";
        }
      );

    # Hack to get home suggestions when using the home-manager NixOS module
    homeConfigurations.nixd = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = { inherit inputs outputs; };
      pkgs = pkgsFor.x86_64-linux;

      modules = [
        nix-colors.homeManagerModules.default

        {
          imports = builtins.attrValues homeManagerModules;
          home.username = "nixd";
          home.homeDirectory = "/home/nixd";
          home.stateVersion = "24.05";
        }
      ];
    };
  };
}
