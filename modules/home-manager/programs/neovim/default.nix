{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withPython3 = false;
    withRuby = false;
    withNodeJs = false;
    vimAlias = true;
    viAlias = true;
    extraPackages = with pkgs; [
      bash-language-server
      delve
      docker-language-server
      emmet-language-server
      gomodifytags
      gopls
      gotools
      lua-language-server
      nil
      nixfmt-rfc-style
      plantuml
      prettier
      selene
      sqruff
      stylua
      typescript-language-server
      vim-language-server
      yaml-language-server
    ];
  };
}
