{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "templ-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "tjdevries";
        repo = "templ.nvim";
        rev = "145a2eb71c3df8f7ab6cf48c7f2dd4de80d4c11c";
        hash = "sha256-ItRLdG6o0433Rs4PBKUGxDLFk1rBx5KGtLfNt/NFL0w=";
      };
    })
  ];
}
