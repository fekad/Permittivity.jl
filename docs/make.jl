using Documenter
using Permittivity

# https://github.com/JuliaPlots/Plots.jl/issues/3012
ENV["GKSwstype"] = "nul"

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
        "Theory" => "theory.md",
        "Models" => "model.md",
        "Composites" => "composite.md",
        "Appendix" => [
            "Drude model" => "appendix/drude.md",
            "Lorentz modes" => "appendix/lorentz.md",
            "Gaussian" => "appendix/gaussian.md",
            "Voigt" => "appendix/voigt.md",
        ],
    ]
)


deploydocs(
    repo = "github.com/fekad/Permittivity.jl",
    devbranch = "main"
)