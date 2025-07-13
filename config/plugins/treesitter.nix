{
  plugins.treesitter = {
    enable = true;
    ensureInstalled = [
      "bash"
      "c"
      "diff"
      "html"
      "lua"
      "luadoc"
      "markdown"
      "vim"
      "vimdoc"
      "typescript"
      "javascript"
      "go"
      "css"
      "prisma"
      "kotlin"
    ];

    settings = {
      highlight.enable = true;
    };

    indent = true;
  };
}
