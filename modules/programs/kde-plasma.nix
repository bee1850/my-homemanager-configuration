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
    };
    shortcuts = {
      "org.kde.spectacle.desktop"."RectangularRegionScreenShot" = [ "Ctrl+PgDown" "Meta+Shift+Print" ];
    };
  };

  };
}





