{ config, pkgs, ...}:
{
    programs.nixvim = {
       
            keymaps = [
                { 
                    key = "<c-n>";
                    mode = [ "n" ];
                    action = ":CHADopen<cr>";
                    options.desc = "Opens ChadTree";
                }
            ];
        
    };
}