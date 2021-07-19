local saga = require 'lspsaga'


saga.init_lsp_saga {
 use_saga_diagnostic_sign = true,
 code_action_icon = 'ﯦ',
 error_sign = '',
 warn_sign = '',
 hint_sign = '',
 infor_sign = '',
 dianostic_header_icon = '   ',
  code_action_prompt = {
    enable        = true,
    sign          = true,
    sign_priority = 20,
    virtual_text  = false,
  },
  code_action_keys = { quit = {'q', '<ESC>'}, exec = '<CR>' },
  border_style     = "round",
}
