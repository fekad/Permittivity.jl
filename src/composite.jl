# @doc raw"""
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

# decomposition