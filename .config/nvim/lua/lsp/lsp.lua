local lspconfig = require'lspconfig'
local prettier = require 'lsp/efm.prettier'
local eslint = require 'lsp/efm.eslint'
local coq = require 'coq'
-- Diagnostics
local mapper = function(mode, key, result, opts)
    vim.api.nvim_buf_set_keymap(0, mode, key, result, opts)
end
local lsp_mapper = function(mode, key, result)
    mapper(mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    --defines error in line via keybinding 
    virtual_text = false,
    underline = true,
    signs = true,
    update_in_insert = false,
  }
)
local disableFormat = function(client)
    client.resolved_capabilities.document_formatting = false
end

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

local function default_on_attach(client)
  print('Attaching to ' .. client.name)

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
        vim.api.nvim_command [[augroup END]]
    end
     -- LSP mappings (only apply when LSP client attached)
    lsp_mapper("n" , "K"         , "require('lspsaga.hover').render_hover_doc()")
    lsp_mapper("n" , "<space>da" , "require'lspsaga.provider'.preview_definition()")
    lsp_mapper("n" , "gR"        , "vim.lsp.buf.references()")
    lsp_mapper("n" , "gr"        , "require('lspsaga.rename').rename()")
    lsp_mapper("n" , "H"         , "require('lspsaga.codeaction').code_action()")
    lsp_mapper("n" , "gin"       , "vim.lsp.buf.incoming_calls()")
    lsp_mapper("n" , "<space>dn" , "require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()")
    lsp_mapper("n" , "<space>dp" , "require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()")
    lsp_mapper("n" , "<space>ds" , "require'lspsaga.diagnostic'.show_line_diagnostics()")
    lsp_mapper("i" , "<C-h>"     , "require('lspsaga.signaturehelp').signature_help()")
    lsp_mapper("n" , "<C-q>"     , "vim.lsp.stop_client(vim.lsp.buf_get_clients(0))")
end

local default_config = {
  on_attach = default_on_attach,
}
lspconfig.efm.setup(coq.lsp_ensure_capabilities({
    on_attach = default_on_attach,
       filetypes = {
            'python',
            'lua',
            'yaml',
            'json',
            'markdown',
            'rst',
            'html',
            'css',
            'vue',
            'javascript',
            'typescript',
            'javascriptreact',
            'typescriptreact',
            'bash',
            'sh',
        },
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {"package.json", ".git/"},
        languages = {
            typescript = {prettier, eslint},
            javascript = {prettier, eslint},
            typescriptreact = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            javascriptvue = {prettier, eslint},
            yaml = {prettier},
            json = {prettier},
            html = {prettier},
            vue = {prettier},
            scss = {prettier},
            css = {prettier},
            markdown = {prettier},
        }
    }
}))
local pid = vim.fn.getpid()
local sumneko_root_path = vim.fn.stdpath('config')..'/lua'
local sumneko_binary = sumneko_root_path.."lua-language-server"
-- Language Servers
lspconfig.vuels.setup(coq.lsp_ensure_capabilities({
on_attach = default_on_attach,
init_options = {documentFormatting = true},

    settings = {
        vetur = {
            completion = {
                autoImport = true,
                tagCasing = "kebab",
                useScaffoldSnippets = true,
            },
            useWorkspaceDependencies = true,
        },
        format = {
            enable = true,
            options = {
                useTabs = false,
                tabSize = 2,
            },
        },
        validation = {
            template = true,
            script = true,
            style = true,
            templateProps = true,
            interpolation = true
        },
    },
}))
lspconfig.bashls.setup(default_config)
lspconfig.cssls.setup(default_config)
lspconfig.dockerls.setup(default_config)
lspconfig.html.setup(default_config)
lspconfig.jsonls.setup(default_config)
lspconfig.denols.setup(coq.lsp_ensure_capabilities({on_attach = disableFormat}))
lspconfig.graphql.setup(default_config)
lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({on_attach = disableFormat}))
lspconfig.rust_analyzer.setup(default_config)
lspconfig.sumneko_lua.setup(coq.lsp_ensure_capabilities({
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
}))
lspconfig.vimls.setup(default_config)
lspconfig.yamlls.setup(default_config)

