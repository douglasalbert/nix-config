{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
    plugins = with pkgs.vimPlugins; [
      vim-fugitive
      vim-airline
      vim-airline-themes
      vim-polyglot
      zoxide-vim
    ];
    initLua = builtins.readFile ../files/nvim.lua;
  };
}
