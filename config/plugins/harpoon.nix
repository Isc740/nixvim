{
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<A-e>";
      action = ''harpoon.ui:toggle_quick_menu(harpoon:list())'';
      options = {
        desc = "Open Harpoon List";
        noremap = true;
        silent = false;
      };
    }
    {
      mode = "n";
      key = "<A-1>";
      action = ''harpoon:list():select(1)'';
      options = {
        desc = "Open File One";
        noremap = true;
        silent = false;
      };
    }
    {
      mode = "n";
      key = "<A-2>";
      action = ''harpoon:list():select(2)'';
      options = {
        desc = "Open File Two";
        noremap = true;
        silent = false;
      };
    }
    {
      mode = "n";
      key = "<A-3>";
      action = ''harpoon:list():select(3)'';
      options = {
        desc = "Open File Three";
        noremap = true;
        silent = false;
      };
    }
    {
      mode = "n";
      key = "<A-4>";
      action = ''harpoon:list():select(4)'';
      options = {
        desc = "Open File Four";
        noremap = true;
        silent = false;
      };
    }
    {
      mode = "n";
      key = "<leader>a";
      action = ''harpoon:list():add()'';
      options = {
        desc = "add file to harpoon";
        noremap = true;
        silent = false;
      };
    }
  ];

}
