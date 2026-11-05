{ pkgs, ... }:

{
  # Languages
  languages.javascript = {
    enable = true;
    #package = pkgs.nodejs_26; # latest as of 2026-11
    corepack.enable = true;
    npm.enable = true;
  };

  languages.python = {
    enable = true;
    #version = "3.15"; # latest as of 2026-11
    venv.enable = true;
    uv = {
      enable = true;
      sync.enable = true;
    };
  };

  # Development tools
  packages = with pkgs; [
    git
  ];

  # Git configuration
  git-hooks.hooks = {
    nixpkgs-fmt.enable = true;
  };

  # TODO: add linters and formatters

  # Development scripts
  scripts = {
    #backend.exec = ''
    #  uv run uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000
    #'';

    #frontend.exec = ''
    #  cd frontend
    #  npm run dev
    #'';

    #mobile.exec = ''
    #  cd mobile
    #  npx expo start
    #'';
  };

  # Project processes
  processes = {
    #backend.exec = "uv run uvicorn backend.main:app --reload";
    #frontend.exec = "cd frontend && npm run dev";
  };
}
