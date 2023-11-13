{ ... }:
{
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
}
