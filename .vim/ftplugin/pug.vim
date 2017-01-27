let s:pug_lint_path = system('PATH=$(npm bin):$PATH && which pug-lint')
let b:syntastic_pug_pug_lint_exec = substitute(s:pug_lint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
