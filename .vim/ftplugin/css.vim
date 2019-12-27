let s:stylelint_path = system('PATH=$(npm bin):$PATH && which stylelint')
let b:syntastic_css_stylelint_exec = substitute(s:stylelint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
