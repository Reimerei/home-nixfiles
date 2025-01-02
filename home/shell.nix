{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = false;
    history = {
      size = 50000;
      save = 50000;
      ignoreAllDups = true;
    };

    initExtra = ''
      # Basic line editing
      bindkey "^A" beginning-of-line
      bindkey "^E" end-of-line
      bindkey "^K" kill-line
      bindkey "^U" kill-whole-line

      # Word movement
      bindkey "^[OD" backward-word  # Ctrl+Left
      bindkey "^[OC" forward-word   # Ctrl+Right

      # FZF
      bindkey "^F" fzf-file-widget
      bindkey "^R" fzf-history-widget

      # Screen
      bindkey "^L" clear-screen

      # History search - Mac
      bindkey '^[[A' history-beginning-search-backward
      bindkey '^[[B' history-beginning-search-forward

      # History search - Linux
      bindkey '^[OA' history-beginning-search-backward
      bindkey '^[OB' history-beginning-search-forward

      if [[ -f /opt/homebrew/bin/brew ]]; then
        eval $(/opt/homebrew/bin/brew shellenv)
      fi
      PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    '';

    shellAliases = {
      ip = "ip --color=auto";
      s = "sudo";
      m = "make -s";
      tf = "terraform";
      dc = "docker compose";
      docker-compose = "docker compose";
      pw = "cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c 22; echo";
      du = "ncdu";
      use = "nix-shell -p";
      ls = "eza";
      ll = "eza -lg";
      la = "eza -a";
      lt = "eza --tree";
      lla = "eza -lga";
      cat = "cat -n";
      sc = "sudo systemctl";
      jf = "sudo journalctl -fe -u ";
    };
  };

  programs.autojump = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    settings = with builtins; fromTOML (readFile ./shell/starship.toml);
  };
}
