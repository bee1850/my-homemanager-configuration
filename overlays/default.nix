{
    nixpkgs.overlays = [
        (import ./overlays/cyberchef.nix)
    ];
}