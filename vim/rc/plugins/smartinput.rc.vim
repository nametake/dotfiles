call smartinput#define_default_rules()
" auto insert new line
call smartinput#define_rule({'at': '''\%#''', 'char': '<Enter>', 'input': '<Enter><Enter><Up><Esc>"_S'})
call smartinput#define_rule({'at': '"\%#"', 'char': '<Enter>', 'input': '<Enter><Enter><Up><Esc>"_S'})
call smartinput#define_rule({'at': '```\%#```', 'char': '<Enter>', 'input': '<Enter><Enter><Up><Esc>"_S'})
" auto remove new line
call smartinput#define_rule({'at': '''\n\%#\n''', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '"\n\%#\n"', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '```\n\%#\n```', 'char': '<BS>', 'input': '<BS><Del>'})
