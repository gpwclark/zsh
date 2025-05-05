# https://github.com/rr-debugger/rr/wiki/Using-rr-in-an-IDE#setting-up-clion
# get around CLion/QtCreator not supporting target extended-remote
define target remote
target extended-remote $arg0
end

define target hook-extended-remote
source ~/.rr_gdbinit
end

# optional: prevent gdb asking for confirmation
# when invoking the run command in gdb
set confirm off

set remotetimeout 100000
source ~/development/terel/know/py_pretty_printers/gdb/pretty_print.py
