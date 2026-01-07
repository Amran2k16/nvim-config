local opt = vim.opt;
local global = vim.g;

global.mapleader = " "
global.maplocalleader = "\\"

require("config.keymaps")
require("config.lazy")

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.timeout = true
opt.timeoutlen = 250
