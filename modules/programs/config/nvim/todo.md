```nix
vim = {

      plugins = with pkgs; [ vimPlugins.async-vim vimPlugins.vim-lsp vimPlugins.asyncomplete-vim vimPlugins.asyncomplete-lsp-vim ];

    };
```