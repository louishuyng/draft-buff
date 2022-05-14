local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local function find_extension(name)
  local mappings = { 
    ["Ruby"] = ".rb",
    ["Typescript"]  = ".ts",
    ["Javascript"] = ".js",
    ["Java"] = ".java",
    ["Golang"] = ".go",
    ["Rust"] = ".rs",
    ["Swift"] = ".swift",
    ["Python"] = ".py",
    ["C"] = ".cpp",
    ["Haskell"] = ".hs",
    ["Scala"] = ".scala",
  }

  return mappings[name]
end

local menu = Menu({
  position = "30%",
  size = {
    width = 30,
    height = 11,
  },
  relative = "editor",
  border = {
    style = "single",
    text = {
      top = "Languages",
      top_align = "center",
    },
  },
  win_options = {
    winblend = 10,
    winhighlight = "Normal:Normal",
  },
}, {
  lines = {
    Menu.item("Ruby"),
    Menu.item("Typescript"),
    Menu.item("Javascript"),
    Menu.item("Java"),
    Menu.item("Golang"),
    Menu.item("Rust"),
    Menu.item("Swift"),
    Menu.item("Python"),
    Menu.item("C"),
    Menu.item("Haskell"),
    Menu.item("Scala"),
  },
  max_width = 30,
  keymap = {
    focus_next = { "j", "<Down>", "<Tab>" },
    focus_prev = { "k", "<Up>", "<S-Tab>" },
    close = { "<Esc>", "<C-c>" },
    submit = { "<CR>", "<Space>" },
  },
  on_close = function()
    print("CLOSED")
  end,
  on_submit = function(item)
    local time = os.time()
    local path = "/tmp/draft-buffer-" .. time .. find_extension(item["text"])

    vim.cmd("e" .. path)
  end,
})

local function select_lang()
  -- mount the component
  menu:mount()

  -- close menu when cursor leaves buffer
  menu:on(event.BufLeave, menu.menu_props.on_close, { once = true })
end

return {
  select_lang = select_lang
}
