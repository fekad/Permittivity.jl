module Permittivity

using Unitful: ustrip
using PhysicalConstants.CODATA2018: ε_0

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
