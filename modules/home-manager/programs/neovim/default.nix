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
      clang-tools
      dockerfile-language-server-nodejs
      lua-language-server
      nil
      nixfmt-rfc-style
      plantuml
      prettier
      pyright
      ripgrep
      selene
      sqruff
      stylua
      vim-language-server
      yaml-language-server
    ];
  };
}
