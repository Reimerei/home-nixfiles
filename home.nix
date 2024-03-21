{
  lib,
  config,
  pkgs,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  home-manager.users = {
    reimerei = {
      imports = [
        ./home/shell.nix
        ./home/git.nix
      ];

      home = {
        username = config.users.users.reimerei.name;
        homeDirectory = lib.mkDefault config.users.users.reimerei.home;
        stateVersion = "23.11";
      };

      programs = {
        home-manager.enable = true;
        jq.enable = true;
        command-not-found.enable = true;
        htop.enable = true;
        info.enable = true;
        ssh.enable = true;
        fzf = {
          enable = true;
          fileWidgetCommand = "fd --type f";
          defaultCommand = "fd --type f";
        };
      };

      home.packages = with pkgs; [
        autojump
        eza
        fd
      ];

      home.sessionVariables = {
        EDITOR = "vim";
        ERL_AFLAGS = "-kernel shell_history enabled";
      };
    };
  };
}
