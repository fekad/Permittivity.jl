using Documenter
using Permittivity

makedocs(
    sitename = "Permittivity.jl",
    authors="Adam Fekete <adam.fekete@unamur.be> and contributors",
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        canonical="https://fekad.github.io/Permittivity.jl"
    ),
    modules = [Permittivity],
    pages=[
        "Home" => "index.md",
        "Models" => "model.md",
        "Composites" => "composite.md"
    ]
)


deploydocs(
    repo = "github.com/fekad/Permittivity.jl",
    devbranch = "main"
)