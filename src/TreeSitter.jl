module TreeSitter

include("native.jl")

const type_regular = TSSymbolTypeRegular
const type_anonymous = TSSymbolTypeAnonymous
const type_auxiliary = TSSymbolTypeAuxiliary

# Julia wrapper around the tree-sitter Parser type.
struct Parser
    c::Ptr{TSParser}
end

# Julia wrapper around the tree-sitter Language type.
struct Language
    c::Ptr{TSLanguage}
end

# Julia wrapper around the tree-sitter Tree type.
struct Tree
    c::Ptr{TSTree}
end

#  Julia wrapper around the tree-sitter TSNode
struct Node
    c::TSNode
end

end
