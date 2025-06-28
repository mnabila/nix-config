{ lib, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {

      # Wait 10 milliseconds for starship to check files under the current directory.
      scan_timeout = 10;

      # Disable the blank line at the start of the prompt
      add_newline = false;

      # format promtp
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_status"
        "$env_var"
        "$nix_shell"
        "$python"
        "$jobs"
        "$cmd_duration"
        "$line_break"
        "$shell"
        "$character"
      ];

    };
  };
}
