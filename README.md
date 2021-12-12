# glsl.vim

> glsl syntax highlighting

## Usage
Files with the extension ```.vert```, ```.tesc```, ```.tese```, ```.geom```, ```.frag```, ```.comp``` and ```.glsl``` or ```.glsl.``` are recognized.
If you use another extension, you can add an autocmd:
```vim
augroup glsl
  autocmd!
  autocmd BufNewFile,BufRead *.<your_extension> set ft=glsl
augroup END
```
