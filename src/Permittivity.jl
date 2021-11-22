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





# @doc raw"""
# # Material models
#
# [source](http://www.fdtdxx.com/features/material-models)
# [article](https://www.researchgate.net/publication/249651487_Free-Space_Transmission_Method_for_the_Characterization_of_Dielectric_and_Magnetic_Materials_at_Microwave_Frequencies)
#
# ## Dielectric (Conductor) Materials
#
# Dielectrics and Conductors includes perfect (lossless) dielectrics, conductive (lossy) materials, and perfect electric conductors.
#
# ## Dispersive Materials
#
# Dispersive (frequency-dependent) materials can correctly describe the physics behind the optical responses.
#
#
# ## Arbitrarily-accurate Models
#
# The arbitrarily-accurate (albeit, perhaps unphysical) fits to experimental optical data can be obtained.
#
# - multi-pole Debye model with static conductivity
#   $$\varepsilon (\omega) = \varepsilon_\infty  + \sum \limits_i^N \frac{\Delta\varepsilon_i}{1 + j \omega \tau_i} + \frac{\sigma_s}{j \omega \varepsilon_0}$$
#   where
#   - $\sigma_s$ the static conductivity
#   - $\Delta\varepsilon_i$ is the change in permittivity due to the ith dispersion
# - Drude model in combination with multiple Lorentz oscillator poles
#   $$\varepsilon (\omega) = \varepsilon_\infty  + \sum \limits_N \frac{\Delta\varepsilon_p \omega_p^2}{\omega_p^2 - \omega(\omega + j 2\delta)}$$
# - Interpolated tabulated data
#
# """


include("models.jl")
include("composite.jl")
include("tabulated.jl")



end # module
