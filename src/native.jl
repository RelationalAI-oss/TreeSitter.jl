import Libdl

"""

This is a modified version of the Clang.jl generated code for the tree-sitter
API. The generated code is not entirely correct, so some modifications were
needed. Those edits are clarified with a comment to make future updates easy.
"""

const ts_lib = "$(deps/libmylang-parser.$(Libdl.dlext)"
const C99bool_t = Cuchar

import CEnum: @cenum

######################################################### Common

const TREE_SITTER_LANGUAGE_VERSION = 9
const TSSymbol = UInt16
const TSLanguage = Cvoid
const TSParser = Cvoid
const TSTree = Cvoid

@cenum(TSInputEncoding,
    TSInputEncodingUTF8 = 0,
    TSInputEncodingUTF16 = 1,
)
@cenum(TSSymbolType,
    TSSymbolTypeRegular = 0,
    TSSymbolTypeAnonymous = 1,
    TSSymbolTypeAuxiliary = 2,
)

struct TSPoint
    row::UInt32
    column::UInt32
end

struct TSRange
    start_point::TSPoint
    end_point::TSPoint
    start_byte::UInt32
    end_byte::UInt32
end

struct TSInput
    payload::Ptr{Cvoid}
    read::Ptr{Cvoid}
    encoding::TSInputEncoding
end

@cenum(TSLogType,
    TSLogTypearse = 0,
    TSLogTypeLex = 1,
)

struct TSLogger
    payload::Ptr{Cvoid}
    log::Ptr{Cvoid}
end

struct TSInputEdit
    start_byte::UInt32
    old_end_byte::UInt32
    new_end_byte::UInt32
    start_point::TSPoint
    old_end_point::TSPoint
    new_end_point::TSPoint
end

struct TSNode
    context::NTuple{4, UInt32}
    id::Ptr{Cvoid}
    tree::Ptr{TSTree}
end

struct TSTreeCursor
    tree::Ptr{Cvoid}
    id::Ptr{Cvoid}
    context::NTuple{2, UInt32}
end

######################################################### API

function ts_parser_new()
    ccall((:ts_parser_new, ts_lib), Ptr{TSParser}, ())
end

function ts_parser_delete(arg1)
    ccall((:ts_parser_delete, ts_lib), Cvoid, (Ptr{TSParser},), arg1)
end

function ts_parser_language(arg1)
    ccall((:ts_parser_language, ts_lib), Ptr{TSLanguage}, (Ptr{TSParser},), arg1)
end

# EDIT somehow the arguments of set_language were missing
function ts_parser_set_language(p, l)
    ccall((:ts_parser_set_language, ts_lib), C99bool_t, (Ptr{TSParser}, Ptr{TSLanguage}), p, l)
end

function ts_parser_logger(arg1)
    ccall((:ts_parser_logger, ts_lib), TSLogger, (Ptr{TSParser},), arg1)
end

function ts_parser_set_logger(arg1, arg2)
    ccall((:ts_parser_set_logger, ts_lib), Cvoid, (Ptr{TSParser}, TSLogger), arg1, arg2)
end

function ts_parser_print_dot_graphs(arg1, arg2)
    ccall((:ts_parser_print_dot_graphs, ts_lib), Cvoid, (Ptr{TSParser}, Cint), arg1, arg2)
end

function ts_parser_halt_on_error(arg1, bool)
    ccall((:ts_parser_halt_on_error, ts_lib), Cvoid, (Ptr{TSParser}, Cint), arg1, bool)
end

function ts_parser_parse(arg1, arg2, arg3)
    ccall((:ts_parser_parse, ts_lib), Ptr{TSTree}, (Ptr{TSParser}, Ptr{TSTree}, TSInput), arg1, arg2, arg3)
end

function ts_parser_parse_string(arg1, arg2, arg3, arg4)
    ccall((:ts_parser_parse_string, ts_lib), Ptr{TSTree}, (Ptr{TSParser}, Ptr{TSTree}, Cstring, UInt32), arg1, arg2, arg3, arg4)
end

function ts_parser_parse_string_encoding(arg1, arg2, arg3, arg4, arg5)
    ccall((:ts_parser_parse_string_encoding, ts_lib), Ptr{TSTree}, (Ptr{TSParser}, Ptr{TSTree}, Cstring, UInt32, TSInputEncoding), arg1, arg2, arg3, arg4, arg5)
end

function ts_parser_enabled()
    ccall((:ts_parser_enabled, ts_lib), Cint, ())
end

function ts_parser_set_enabled(arg1, bool)
    ccall((:ts_parser_set_enabled, ts_lib), Cvoid, (Ptr{TSParser}, Cint), arg1, bool)
end

function ts_parser_operation_limit()
    ccall((:ts_parser_operation_limit, ts_lib), Cint, ())
end

function ts_parser_set_operation_limit(arg1, size_t)
    ccall((:ts_parser_set_operation_limit, ts_lib), Cvoid, (Ptr{TSParser}, Cint), arg1, size_t)
end

function ts_parser_reset(arg1)
    ccall((:ts_parser_reset, ts_lib), Cvoid, (Ptr{TSParser},), arg1)
end

function ts_parser_set_included_ranges(arg1, arg2, arg3)
    ccall((:ts_parser_set_included_ranges, ts_lib), Cvoid, (Ptr{TSParser}, Ptr{TSRange}, UInt32), arg1, arg2, arg3)
end

function ts_parser_included_ranges(arg1, arg2)
    ccall((:ts_parser_included_ranges, ts_lib), Ptr{TSRange}, (Ptr{TSParser}, Ptr{UInt32}), arg1, arg2)
end

function ts_tree_copy(arg1)
    ccall((:ts_tree_copy, ts_lib), Ptr{TSTree}, (Ptr{TSTree},), arg1)
end

function ts_tree_delete(arg1)
    ccall((:ts_tree_delete, ts_lib), Cvoid, (Ptr{TSTree},), arg1)
end

function ts_tree_root_node(arg1)
    ccall((:ts_tree_root_node, ts_lib), TSNode, (Ptr{TSTree},), arg1)
end

function ts_tree_edit(arg1, arg2)
    ccall((:ts_tree_edit, ts_lib), Cvoid, (Ptr{TSTree}, Ptr{TSInputEdit}), arg1, arg2)
end

function ts_tree_get_changed_ranges(arg1, arg2, arg3)
    ccall((:ts_tree_get_changed_ranges, ts_lib), Ptr{TSRange}, (Ptr{TSTree}, Ptr{TSTree}, Ptr{UInt32}), arg1, arg2, arg3)
end

function ts_tree_language(arg1)
    ccall((:ts_tree_language, ts_lib), Ptr{TSLanguage}, (Ptr{TSTree},), arg1)
end

function ts_node_start_byte(arg1)
    ccall((:ts_node_start_byte, ts_lib), UInt32, (TSNode,), arg1)
end

function ts_node_start_point(arg1)
    ccall((:ts_node_start_point, ts_lib), TSPoint, (TSNode,), arg1)
end

function ts_node_end_byte(arg1)
    ccall((:ts_node_end_byte, ts_lib), UInt32, (TSNode,), arg1)
end

function ts_node_end_point(arg1)
    ccall((:ts_node_end_point, ts_lib), TSPoint, (TSNode,), arg1)
end

function ts_node_symbol(arg1)
    ccall((:ts_node_symbol, ts_lib), TSSymbol, (TSNode,), arg1)
end

function ts_node_type(arg1)
    ccall((:ts_node_type, ts_lib), Cstring, (TSNode,), arg1)
end

function ts_node_string(arg1)
    ccall((:ts_node_string, ts_lib), Cstring, (TSNode,), arg1)
end

function ts_node_eq()
    ccall((:ts_node_eq, ts_lib), Cint, ())
end

function ts_node_is_null()
    ccall((:ts_node_is_null, ts_lib), Cint, ())
end

function ts_node_is_named()
    ccall((:ts_node_is_named, ts_lib), Cint, ())
end

# EDIT arguments were missing
function ts_node_is_missing(arg::TSNode)
    ccall((:ts_node_is_missing, ts_lib), C99bool_t, (TSNode,), arg)
end

# EDIT arguments were missing
function ts_node_is_extra(arg::TSNode)
    ccall((:ts_node_is_extra, ts_lib), C99bool_t, (TSNode,), arg)
end

# EDIT arguments were missing
function ts_node_is_ambiguous(arg)
    ccall((:ts_node_is_ambiguous, ts_lib), C99bool_t, (TSNode,), arg)
end

function ts_node_amb_count(arg1)
    ccall((:ts_node_amb_count, ts_lib), UInt32, (TSNode,), arg1)
end

function ts_node_amb_child_count(arg1, arg2)
    ccall((:ts_node_amb_child_count, ts_lib), UInt32, (TSNode, UInt32), arg1, arg2)
end

function ts_node_amb_child(arg1, arg2, arg3)
    ccall((:ts_node_amb_child, ts_lib), TSNode, (TSNode, UInt32, UInt32), arg1, arg2, arg3)
end

function ts_node_has_changes()
    ccall((:ts_node_has_changes, ts_lib), Cint, ())
end

# EDIT arguments were missing
function ts_node_has_error(arg)
    ccall((:ts_node_has_error, ts_lib), C99bool_t, (TSNode,), arg)
end

function ts_node_parent(arg1)
    ccall((:ts_node_parent, ts_lib), TSNode, (TSNode,), arg1)
end

function ts_node_child(arg1, arg2)
    ccall((:ts_node_child, ts_lib), TSNode, (TSNode, UInt32), arg1, arg2)
end

function ts_node_named_child(arg1, arg2)
    ccall((:ts_node_named_child, ts_lib), TSNode, (TSNode, UInt32), arg1, arg2)
end

function ts_node_child_count(arg1)
    ccall((:ts_node_child_count, ts_lib), UInt32, (TSNode,), arg1)
end

function ts_node_named_child_count(arg1)
    ccall((:ts_node_named_child_count, ts_lib), UInt32, (TSNode,), arg1)
end

function ts_node_next_sibling(arg1)
    ccall((:ts_node_next_sibling, ts_lib), TSNode, (TSNode,), arg1)
end

function ts_node_next_named_sibling(arg1)
    ccall((:ts_node_next_named_sibling, ts_lib), TSNode, (TSNode,), arg1)
end

function ts_node_prev_sibling(arg1)
    ccall((:ts_node_prev_sibling, ts_lib), TSNode, (TSNode,), arg1)
end

function ts_node_prev_named_sibling(arg1)
    ccall((:ts_node_prev_named_sibling, ts_lib), TSNode, (TSNode,), arg1)
end

function ts_node_first_child_for_byte(arg1, arg2)
    ccall((:ts_node_first_child_for_byte, ts_lib), TSNode, (TSNode, UInt32), arg1, arg2)
end

function ts_node_first_named_child_for_byte(arg1, arg2)
    ccall((:ts_node_first_named_child_for_byte, ts_lib), TSNode, (TSNode, UInt32), arg1, arg2)
end

function ts_node_descendant_for_byte_range(arg1, arg2, arg3)
    ccall((:ts_node_descendant_for_byte_range, ts_lib), TSNode, (TSNode, UInt32, UInt32), arg1, arg2, arg3)
end

function ts_node_named_descendant_for_byte_range(arg1, arg2, arg3)
    ccall((:ts_node_named_descendant_for_byte_range, ts_lib), TSNode, (TSNode, UInt32, UInt32), arg1, arg2, arg3)
end

function ts_node_descendant_for_point_range(arg1, arg2, arg3)
    ccall((:ts_node_descendant_for_point_range, ts_lib), TSNode, (TSNode, TSPoint, TSPoint), arg1, arg2, arg3)
end

function ts_node_named_descendant_for_point_range(arg1, arg2, arg3)
    ccall((:ts_node_named_descendant_for_point_range, ts_lib), TSNode, (TSNode, TSPoint, TSPoint), arg1, arg2, arg3)
end

function ts_node_edit(arg1, arg2)
    ccall((:ts_node_edit, ts_lib), Cvoid, (Ptr{TSNode}, Ptr{TSInputEdit}), arg1, arg2)
end

function ts_tree_cursor_new(arg1)
    ccall((:ts_tree_cursor_new, ts_lib), TSTreeCursor, (TSNode,), arg1)
end

function ts_tree_cursor_delete(arg1)
    ccall((:ts_tree_cursor_delete, ts_lib), Cvoid, (Ptr{TSTreeCursor},), arg1)
end

function ts_tree_cursor_reset(arg1, arg2)
    ccall((:ts_tree_cursor_reset, ts_lib), Cvoid, (Ptr{TSTreeCursor}, TSNode), arg1, arg2)
end

function ts_tree_cursor_current_node(arg1)
    ccall((:ts_tree_cursor_current_node, ts_lib), TSNode, (Ptr{TSTreeCursor},), arg1)
end

function ts_tree_cursor_goto_parent()
    ccall((:ts_tree_cursor_goto_parent, ts_lib), Cint, ())
end

function ts_tree_cursor_goto_next_sibling()
    ccall((:ts_tree_cursor_goto_next_sibling, ts_lib), Cint, ())
end

function ts_tree_cursor_goto_first_child()
    ccall((:ts_tree_cursor_goto_first_child, ts_lib), Cint, ())
end

function ts_tree_cursor_goto_first_child_for_byte(arg1, arg2)
    ccall((:ts_tree_cursor_goto_first_child_for_byte, ts_lib), Int64, (Ptr{TSTreeCursor}, UInt32), arg1, arg2)
end

function ts_language_symbol_count(arg1)
    ccall((:ts_language_symbol_count, ts_lib), UInt32, (Ptr{TSLanguage},), arg1)
end

function ts_language_symbol_name(arg1, arg2)
    ccall((:ts_language_symbol_name, ts_lib), Cstring, (Ptr{TSLanguage}, TSSymbol), arg1, arg2)
end

function ts_language_symbol_for_name(arg1, arg2)
    ccall((:ts_language_symbol_for_name, ts_lib), TSSymbol, (Ptr{TSLanguage}, Cstring), arg1, arg2)
end

function ts_language_symbol_type(arg1, arg2)
    ccall((:ts_language_symbol_type, ts_lib), TSSymbolType, (Ptr{TSLanguage}, TSSymbol), arg1, arg2)
end

function ts_language_version(arg1)
    ccall((:ts_language_version, ts_lib), UInt32, (Ptr{TSLanguage},), arg1)
end
