{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.my-plasma;

in
{

  options = {
    programs.my-plasma = {
      enable = lib.mkEnableOption "Enable my personal plasma Configuration";
    };
  };

  config = lib.mkIf cfg.enable {

    programs.plasma = {
      enable = true;
      configFile = {
        "kdeglobals"."General"."TerminalApplication" = "alacritty";
        "kdeglobals"."General"."TerminalService" = "Alacritty.desktop";
        "kcminputrc"."Keyboard"."NumLock" = 1;
        "plasmarc"."Wallpapers"."usersWallpapers" = "/home/berkan/Downloads/67tlp8o2a6h71.png";
      };
      shortcuts = {
        "org.kde.spectacle.desktop"."RectangularRegionScreenShot" = [ "Ctrl+PgDown" "Meta+Shift+Print" ];
      };
    };

  };
}





