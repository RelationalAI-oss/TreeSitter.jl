using BinDeps

depsdir = @__DIR__

# Build TreeSitter
BinDeps.run(@build_steps begin
    ChangeDirectory(joinpath(depsdir, "tree-sitter"))
    `script/build-lib`
end)

# # Build Your Grammar File
# BinDeps.run(@build_steps begin
#     ChangeDirectory(depsdir)
#     `./generate.sh`
#     `make clean all`
# end)
