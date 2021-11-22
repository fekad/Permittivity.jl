module Permittivity

# import Base: size, length

# Interpolation
using Dierckx: Spline1D

# Permittivity (Electric susceptibility)
# isotropic vs anisotropic
# real vs complex

abstract type AbstractPermittivity end
abstract type Dielectric <: AbstractPermittivity end
abstract type Dispersive <: AbstractPermittivity end
abstract type Composite <: Dispersive end
abstract type Tabulated <: Dispersive end


include("models.jl")
include("composite.jl")
include("tabulated.jl")



end # module
