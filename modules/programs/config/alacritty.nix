{ config, pkgs, ... }:
{
    programs.alacritty.settings = {
        font = {
            normal = {
                family = "Meslo Nerd Font";
                style = "Regular";
            };
            bold = {
                family = "Meslo Nerd Font";
                style = "Bold";
            };
            italic = {
                family = "Meslo Nerd Font";
                style = "Italic";
            };
            bold_italic = {
                family = "Meslo Nerd Font";
                style = "Bold Italic";
            };
            
        };
    };
}