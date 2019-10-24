If you want to change the parser grammar, some work has to be done manually:

1. Install tree-sitter v 0.14.5 binary on your local machine, using the appropriate OS binaries
2. Include the tree-sitter binary into your $PATH
3. Implement your changes in the Grammar, i.e., in mylang.js
4. call generate.sh under its directory
5. Rebuild Julia.


Notes:

- generate.sh invokes tree-sitter to generate C source code from `mylang.js`.

- Running generate.sh requires the tree-sitter command-line tool. It generates C files that
are checked-in.

- compile.sh compiles the tree-sitter runtime library and the generated C code for the mylang
parser into a single dynamic library.
