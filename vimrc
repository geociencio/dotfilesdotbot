set nocompatible 		" NOTA:  Setting 'compatible'
				" cambia numerosas opciones, asi que alguna
				" opcion se debe colocar 'set' DESPUES de
				" 'set compatible'.

runtime! arch.vim		" Esta linea no deveria ser borrada ya que esto
				" asegura que varias opciones seran propiamente
				" colocadas para trabajar con los paquetes
				" relacionados a Vim.

				" Configurar Powerline para vim
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
"set  rtp+=/usr/lib/python3.9/site-packages/powerline/bindings/vim/
set ls=2
set t_Co=256
				" Los complementos se descargaran al directorio
			       	" especificado
call plug#begin('~/.vim/plugged')
				" Declarar lista de complementos
Plug 'powerline/powerline'
Plug 'doums/darcula'
Plug 'relastle/bluewery.vim'
Plug 'kyoz/purify', { 'rtp': 'vim'}
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
				" La lista finaliza aqui.
call plug#end()


"==============================================================================
" Ajustes basicos
"==============================================================================
syntax on			        " Permite a Vim mostrar partes del texto en otra
				            " fuente o color.
set number			        " Mostrar numeros de linea
set numberwidth=1		    " Numero minimo de columnas
filetype on 			    " Intenta detectar tipos de archivos
filetype plugin indent on	" Habilitar la carga del archivo de sangrias
				            " para el tipo de archivos
set clipboard=unnamed		" Acceder al contenido de clipboard del sistema
set history=500			    " Lineas de historial a recordar
set background=dark		    " Se usa fondo negro para cambiar color de letra
set title			        " Mostrar el titulo en la barra
set wildmenu			    " Menu completado en modo comando en <Tab>
set wildmode=full		    " <Tab> alterna entre todas las opciones
set showcmd			        " Mostrar comando (parcial) en la última línea de 
				            " la pantalla.
set backspace=indent,eol,start  " Permitir retroceder sobre todo en el modo de 
                                " inserción.
set tabstop=4			    " Iniciar la sangria en 4
set shiftwidth=4		    " cambiar el número de caracteres de espacio 
				            " insertados para la sangría
set expandtab			    " insertar caracteres de espacio siempre que se 
				            " presione la tecla de tabulación
set smarttab			    " afecta cómo se interpretan las pulsaciones de la
				            " tecla <TAB> dependiendo de dónde esté el cursor
set mouse=a			        " Habilite el uso del mouse para todos los modos
set encoding=utf8   		" La codificación mostrada.
set nobackup		    	" No crear archivos de respaldo
set noswapfile			    " No crear archivos de intercambio

                            " Obtener sangría para seguir los estándares PEP 8.
                            " y mejorar la manipulacion de la sangría automática.
au Filetype python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au FileType python set foldmethod=indent foldlevel=80

                            " Arregla en columnas los archivos csv alineados a
                            " la izquierda
let g:csv_autocmd_arrange = 1
let b:csv_arrange_align = 'l*'
                            " Ejecutar pyflake8
autocmd FileType python map <Leader>8 :call Flake8()<CR>
                            " Ejecutar cuando se guerden los archivos py
autocmd BufWritePost *.py call Flake8()
                            " Ignorar Errores
let g:flake8_ignore="E501,W293"
let g:user_emmet_leader_key=','
let g:indentLine_setColor=0
let g:tagalong_verbose=1
let g:indentLine_char_list=['|','¦','┆','┊']

colorscheme purify

