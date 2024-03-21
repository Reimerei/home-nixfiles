{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userEmail = "git@bjrm.de";
    userName = "reimerei";
    signing.key = "89F185C3D747CDCF";
    signing.signByDefault = true;
    extraConfig = {
      core.ignoreCase = true;
      pull.rebase = true;
      init.defaultBranch = "main";
    };
    ignores = [".elixir-ls" ".vscode" ".DS_Store" "**/.DS_Store"];
  };

  home.sessionVariables = {
    GITSTATUS_LOG_LEVEL = "DEBUG";
  };
}
