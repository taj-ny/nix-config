{
  description = "❄️ My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    # Last commit from nixos-unstable with working packages
    nixpkgs-working.url = "github:nixos/nixpkgs/d70bd19e0a38ad4790d3913bf08fcbfc9eeca507";

    darkly = {
      url = "github:Bali10050/Darkly/FeatureDarkly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware.url = "github:nixos/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    kwin-better-blur = {
      url = "github:taj-ny/kwin-effects-forceblur/window-rules";
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
    ...
  } @ inputs: let
    inherit (self) outputs;

    lib = nixpkgs.lib.extend (_: _: import ./lib { lib = nixpkgs.lib; });
    systems = [ "x86_64-linux" ];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    });
  in
  rec {
    inherit lib;
    devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
    # Hack to get home suggestions when using the home-manager NixOS module
    homeConfigurations.nixd = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {
        inherit inputs outputs;
        lib = lib.extend (_: _: inputs.home-manager.lib);
      };
      modules = [
        {
          imports = builtins.attrValues homeManagerModules;
          home = {
            homeDirectory = "/";
            stateVersion = "25.05";
            username = "nixd";
          };
        }
      ];
      pkgs = pkgsFor.x86_64-linux;
    };
    homeManagerModules = import ./home/modules;
    nixosConfigurations =
      lib.mapAttrs (name: value:
        lib.nixosSystem {
          inherit lib;
          modules = [
              ./nixos/config/_shared/global
              ./nixos/config/${name}
              {
                environment.etc.current-config.text = "${toString self}";
                networking.hostName = name;
              }
            ] ++ (builtins.attrValues nixosModules);
          specialArgs = { inherit inputs outputs; };
        }
      ) (
        builtins.removeAttrs (
          builtins.readDir ./nixos/config
        ) [ "common" ]
      );
    nixosModules = import ./nixos/modules;
    overlays = import ./overlays { inherit inputs lib; };
    packages = forEachSystem (pkgs: import ./pkgs/default.nix { inherit lib pkgs; });
  };
}
