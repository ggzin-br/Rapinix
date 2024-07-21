# Instruções de build do Kernel

## Mach
### Requisitos
- gcc
- libc de 32bits
- make
- gawk

### Lista de comandos
`cd gnumach`\
`autoreconf --install`\
`mkdir build`\
`cd build`\
`../configure --prefix= --host=i686-gnu LD=i686-linux-gnu-ld CC=i686-linux-gnu-gcc`

<b>Instalação dos headers para o MIG</b>
###
`make DESTDIR=~/gnu install-data`

<b>Depois de compilar o MIG</b>
###
`make gnumach.gz`\
`make check`

## MIG
### Requisitos
- libc de 32bits 
- gawk 
- yacc (bison) 
- lex (flex) 
- make

### Lista de comandos
`cd mig`\
`autoreconf --install`\
`mkdir build`\
`cd build`\
`GNU=~/gnu`\
`TARGET_CPPFLAGS=-I"$GNU"/include ../configure --prefix="$GNU" --target=i686-gnu TARGET_CC=i686-linux-gnu-gcc`\
`make all install`

##
#### Obtenção dos códigos
```
git clone https://git.savannah.gnu.org/git/hurd/mig.git/
git clone https://git.savannah.gnu.org/git/hurd/gnumach.git/
```
