    var mylang_grammar = require('./mylang');
    var rules = mylang_grammar.rules
    var new_grammar = {
        name: 'mylang_declarations',
        extras: mylang_grammar.extras,
        word: mylang_grammar.word,
        inline: mylang_grammar.inline,
        conflicts: mylang_grammar.conflicts,
        rules: {
            top_level: $ => repeat($.declaration),
            ...rules
        },
    };

    module.exports = grammar(new_grammar);
