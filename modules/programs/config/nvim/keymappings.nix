{ config, pkgs, ...}:
{
    programs.nixvim = {
        {
            keymaps = [
                { 
                    key = "<c-n>";
                    mode = [ "n" ];
                    action = ":CHADopen";
                    options.desc = "Opens ChadTree";
                }
            ];
        };
    };
}