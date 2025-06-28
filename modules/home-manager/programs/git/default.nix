{
  programs.git = {
    enable = true;
    userName = "M. Nabil Adani";
    userEmail = "nblid48@gmail.com";

    signing = {
      key = "F4D7776B503B400E";
      signByDefault = true;
    };

    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
    };

    extraConfig = {
      core = {
        editor = "nvim";
        autocrlf = "input";
      };
      pull.rebase = true;
      credential.helper = "store";
      init.defaultBranch = "main";

      commit.gpgsign = true;

      mergetool."vimdiff".cmd = ''
        nvim -d $LOCAL $REMOTE $MERGED -c '$wincmd w' -c 'wincmd J'
      '';

      difftool.prompt = false;
      diff.tool = "vimdiff";

      url."git@github.com:".insteadOf = "https://github.com";
      url."git@gitlab.com:".insteadOf = "https://gitlab.com";
    };
  };
}
