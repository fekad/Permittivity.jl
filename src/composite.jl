@doc raw"""
    MultiPoleDebyeModel(eps_inf, sigma, eps, tau)

The multi-pole Debye model with static conductivity:
```math
\varepsilon (\omega) = \varepsilon_\infty  + \sum \limits_i^N \frac{\Delta\varepsilon_i}{1 + j \omega \tau_i} + \frac{\sigma_s}{j \omega \varepsilon_0}
```
where
- ``\sigma_s`` the static conductivity
- ``\Delta\varepsilon_i`` is the change in permittivity due to the ith dispersion

"""
struct MultiPoleDebyeModel{T<:AbstractFloat} <: Composite
    eps_inf::T
    sigma::T
    eps::Vector{T}
    tau::Vector{T}
end

function (m::MultiPoleDebyeModel)(omega)
    poles = sum(1:lentgh(m.eps)) do i
        m.eps[i] / (1 + (im * omega * m.tau[i]))
    end
    m.eps_inf + poles + m.sigma / (im *  omega * eps_0)
end



@doc raw"""
    MultiLorentzPoleModel(eps_inf, eps, omega_p, delta)

The Drude model in combination with multiple Lorentz oscillator poles:
```math
\varepsilon (\omega) = \varepsilon_\infty  + \sum \limits_N \frac{\Delta\varepsilon \omega_p^2}{\omega_p^2 - \omega(\omega + j 2\delta)}
```
"""
struct MultiLorentzPoleModel{T<:AbstractFloat} <: Composite
    eps_inf::T
    eps::Vector{T}
    omega_p::Vector{T}
    delta::Vector{T}
end

function (m::MultiLorentzPoleModel)(omega)
    poles = sum(1:lentgh(m.eps)) do i
        m.eps[i] * m.omega_p[i]^2 / (m.omega_p[i]^2 - omega * (omega + im * 2 * m.delta[i]))
    end
    m.eps_inf + poles
end



