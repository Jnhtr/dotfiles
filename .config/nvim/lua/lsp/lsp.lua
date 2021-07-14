local lspconfig = require'lspconfig'
local prettier = require 'lsp/efm.prettier'
local eslint = require 'lsp/efm.eslint'
-- Diagnostics

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    --defines error in line via keybinding 
    virtual_text = false,
    underline = true,
    signs = true,
    update_in_insert = false,
  }
)
vim.fn.sign_define("LspDiagnosticsSignError",
    {text = "", texthl = "GruvboxRed"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
    {text = "", texthl = "GruvboxYellow"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
    {text = "", texthl = "GruvboxBlue"})
vim.fn.sign_define("LspDiagnosticsSignHint",
    {text = "", texthl = "GruvboxAqua"})

local function lsp_map(mode, left_side, right_side)
  vim.api.nvim_buf_set_keymap(0, mode, left_side, right_side, {noremap=true})           
end
local format_async = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then return end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then vim.api.nvim_command("noautocmd :update") end
    end
end

local function on_attach(client)
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_exec([[
         augroup LspAutocommands
             autocmd! * <buffer>
             autocmd BufWritePost <buffer> LspFormatting
         augroup END
         ]], true)
    end
end

local disableFormat = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
end
local function default_on_attach(client)
  print('Attaching to ' .. client.name)

  lsp_map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
  lsp_map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
  lsp_map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
  lsp_map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
  lsp_map('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
  lsp_map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
  lsp_map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
  lsp_map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
  lsp_map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
  lsp_map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
  lsp_map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
end

local default_config = {
  on_attach = default_on_attach,
}
lspconfig.efm.setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            typescript = {prettier, eslint},
            javascript = {prettier, eslint},
            typescriptreact = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            yaml = {prettier},
            json = {prettier},
            html = {prettier},
            scss = {prettier},
            css = {prettier},
            markdown = {prettier},
        }
    }
}
local pid = vim.fn.getpid()
local sumneko_root_path = vim.fn.stdpath('config')..'/lua/lua-language-server/'
local sumneko_binary = sumneko_root_path.."/bin/"..'Linux'.."/lua-language-server"
-- Language Servers
lspconfig.pyls.setup(default_config)
lspconfig.vuels.setup(default_config)
lspconfig.bashls.setup(default_config)
lspconfig.cssls.setup(default_config)
lspconfig.dockerls.setup(default_config)
lspconfig.html.setup(default_config)
lspconfig.jsonls.setup(default_config)
lspconfig.denols.setup{on_attach = disableFormat}
lspconfig.graphql.setup(default_config)
lspconfig.tsserver.setup{on_attach = disableFormat}
lspconfig.rust_analyzer.setup(default_config)
lspconfig.zeta_note.setup({
	cmd = {'~.local/bin/zeta-note'}
})
lspconfig.sumneko_lua.setup({
    cmd = {sumneko_binary, "-E", sumneko_root_path .. '/main.lua'},
    on_attach = default_on_attach,
    settings = {
      Lua ={
       runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';')
        },
        diagnostics = {
          globals = {'vim'}
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
          }
        }
      }
    }
})
lspconfig.vimls.setup(default_config)
lspconfig.yamlls.setup(default_config)
