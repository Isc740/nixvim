{
  plugins.lint = {
    enable = true;

    lintersByFt = {
      nix = [ "nix" ];
      typescript = [ "eslint" ];
      typescriptreact = [ "eslint" ];
      javascript = [ "eslint" ];
      javascriptreact = [ "eslint" ];
      # markdown = [
      # ];
      #clojure = ["clj-kondo"];
      #dockerfile = ["hadolint"];
      #inko = ["inko"];
      #janet = ["janet"];
      #json = ["jsonlint"];
      #rst = ["vale"];
      #ruby = ["ruby"];
      #terraform = ["tflint"];
      #text = ["vale"];
    };

    # Create autocommand which carries out the actual linting
    # on the specified events.
    autoCmd = {
      callback.__raw = ''
        function()
          require('lint').try_lint()
        end
      '';
      group = "lint";
      event = [
        "BufEnter"
        "BufWritePost"
        "InsertLeave"
      ];
    };
  };

  # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
  autoGroups = {
    lint = {
      clear = true;
    };
  };
}
