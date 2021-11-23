module Permittivity

using  PhysicalConstants.CODATA2018: c_0, ε_0, μ_0
const eps_0 = 1.

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

export DielectricConstant, DielectricModel, DebyeModel, ColeColeModel, ColeDavidson, HavriliakNegamiModel, FreeElectronPlasmaModel, DrudeModel
# LorentzModel
include("model.jl")

export MultiPoleDebyeModel, MultiLorentzPoleModel
include("composite.jl")

export PermittivityTable
include("tabulated.jl")


end # module
