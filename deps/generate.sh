#! /usr/bin/env bash

# This is the generate script we have been using. Your language grammar should be defined
# in mylang.js in this same directory.

set -e

function generate() {
    echo "Generating parser for $1 $2"
    cat > grammar.js <<EOF
    var mylang_grammar = require('./mylang');
    var rules = mylang_grammar.rules
    var new_grammar = {
        name: 'mylang_$1',
        extras: mylang_grammar.extras,
        word: mylang_grammar.word,
        inline: mylang_grammar.inline,
        conflicts: mylang_grammar.conflicts,
        rules: {
            top_level: \$ => $2,
            ...rules
        },
    };

    module.exports = grammar(new_grammar);
EOF
    cat grammar.js
    tree-sitter generate
    cp src/parser.c src/parser_$1.c
}

generate declarations 'repeat($.declaration)'
generate declaration '$.declaration'
generate expr '$.expr'
