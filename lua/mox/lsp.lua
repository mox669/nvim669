local cmp = require('cmp_nvim_lsp')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('moxlsp', {}),
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
    local buffer = vim.api.nvim_get_current_buf()
    local bufopts = { noremap = true, silent = true, buffer = buffer }

    if client:supports_method('textDocument/codeAction') then
      vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    end
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(
        true,
        client.id,
        event.buf,
        { autotrigger = true }
      )
    end
    if client:supports_method('textDocument/declaration') then
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    end

    if client:supports_method('textDocument/definition') then
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    end
    if client:supports_method('textDocument/diagnostic') then
      vim.keymap.set('n', '<Leader>di', vim.diagnostic.open_float)
    end
    if client:supports_method('textDocument/hover') then
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    end
    if client:supports_method('textDocument/implementation') then
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    end
    if client:supports_method('textDocument/references') then
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    end
    if client:supports_method('textDocument/rename') then
      vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    end
    -- if client:supports_method('textDocument/signatureHelp') then
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- end
    if client:supports_method('textDocument/typeDefinition') then
      vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
    end

    if
      not client:supports_method('textDocument/willSaveWaitUntil')
      and client:supports_method('textDocument/formatting')
    then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('moxlsp', { clear = false }),
        buffer = event.buf,
        callback = function()
          vim.lsp.buf.format({
            bufnr = event.buf,
            id = client.id,
            timeout_ms = 1000,
          })
        end,
      })
    end

    -- extend capabilities with cmp.capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    vim.list_extend(capabilities, cmp.default_capabilities())
  end,
})
