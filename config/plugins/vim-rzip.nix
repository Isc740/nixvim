{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "rzip-vim";
      src = pkgs.fetchFromGitHub {
        owner = "lbrayner";
        repo = "vim-rzip";
        rev = "f65400fed27b27c7cff7ef8d428c4e5ff749bf28";
        hash = "sha256-0000000000000000000000000000000000000000000=";
      };
    })
  ];
}
