local o = vim.o

o.mouse = "a"
o.clipboard = 'unnamedplus'
o.smoothscroll = true
o.cursorlineopt = 'both'

o.relativenumber = true
o.number = true

o.expandtab = false
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

o.spell = true
o.spelllang = "en_us"
o.spelloptions = "noplainbuffer"

vim.uv.os_setenv("JAVA_HOME",  "/usr/lib/jvm/java-21-temurin/")
