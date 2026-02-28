# fluxer-nix

Nix flake for the [Fluxer](https://fluxer.app/) desktop application.

## Usage

This is just the package, no options or anything.

### 1. Add the flake input

```nix
inputs.eden-flake.url = "github:ardishko/fluxer-nix";
```

### 2. Install the package

(given that you've passed the inputs to the file where you define your packages...)

**Home Manager:**
```nix
home.packages = [ inputs.fluxer-nix.packages.${pkgs.system}.fluxer ];
```

**NixOS:**
```nix
environment.systemPackages = [ inputs.fluxer-nix.packages.${pkgs.system}.fluxer ];
```

## Updates

The auto-updater is currently a WIP, however below is how it's supposed to work:

The package is automatically updated daily via GitHub Actions. When a new release is detected with a Linux AppImage, the package link is updated and a PR is opened. If the build passes, the PR is merged automatically.
