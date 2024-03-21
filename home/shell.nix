{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "autojump"
        "docker"
        "terraform"
        "docker-compose"
        "rsync"
        "mix"
        "git"
        "ansible"
      ];
      theme = "risto";
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./shell/p10k.zsh;
        file = "";
      }
    ];
    initExtra = ''
      if [[ -r "''${XDG_CACHE_HOME:-\$HOME/.cache}/p10k-instant-prompt-\''${(%):-%n}.zsh" ]]; then
        source "\''${XDG_CACHE_HOME:-\$HOME/.cache}/p10k-instant-prompt-\''${(%):-%n}.zsh"
      fi
      if [[ -f /opt/homebrew/bin/brew ]]; then
        eval $(/opt/homebrew/bin/brew shellenv)
      fi
      PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
      source "$HOME/.config/zsh/plugins/powerlevel10k-config"
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
      lc = "sudo journalctl -fe -u ";
    };
  };
}
