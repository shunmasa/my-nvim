vim.g.copilot_filetypes ={xml =false,markdown = false}

--[[ 
vim.keymap.set.keymap("i","<C-a>",":copilot#Accept('\\<CR>')<CR>",{silent=true})
 ]]
vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]


