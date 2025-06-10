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
      "css"
      "prisma"
    ];

    # TODO: Figure out how to do this
    # highlight = {
    #   enable = true;
    #
    #   # Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
    #   #  If you are experiencing weird indenting issues, add the language to
    #   #  the list of additional_vim_regex_highlighting and disabled languages for indent.
    #   additional_vim_regex_highlighting = [
    #     "ruby"
    #   ];
    # };

    indent = true;
  };
}
