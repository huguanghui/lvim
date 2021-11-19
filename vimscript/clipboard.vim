if executable('clipboard-provider')
  let g:clipboard ={
  \ 'name': 'myClipboard',
  \   'copy': {
  \      '+': 'clipboard-provider copy',
  \      '*': 'env COPY_PROVIDERS=tmux clipboard-provider copy',
  \    },
  \   'paste': {
  \      '+': 'clipboard-provider paste',
  \      '*': 'env COPY_PROVIDERS=tmux clipboard-provider paste',
  \    },
  \ }
endif
