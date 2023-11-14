{ config, pkgs, ... }:
{
  programs.alacritty.settings = {
    font = {
      normal = {
        family = "MesloLGS NF";
        style = "Regular";
      };
      bold = {
        family = "MesloLGS NF";
        style = "Bold";
      };
      italic = {
        family = "MesloLGS NF";
        style = "Italic";
      };
      bold_italic = {
        family = "MesloLGS NF";
        style = "Bold Italic";
      };

    };
  };
}
