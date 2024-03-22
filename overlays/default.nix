{
  nixpkgs.overlays = [
    (import ./cyberchef.nix)
  ];
}
