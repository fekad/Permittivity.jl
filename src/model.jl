@doc raw"""
    DielectricConstant(eps_inf)

The dielectric constant:
```math
\varepsilon (\omega) = \varepsilon_\infty
```
where ``\varepsilon`` can be real or complex value.


# Example
```julia-repl
eps_inf = 5.

omega = exp10.(-2:.1:3)

m = DielectricConstant(eps_inf)
ε = m.(omega)

plot(omega, [real(ε) imag(ε)], label=["Re(ε(ω))" "Im(ε(ω))"], xlabel="Frequency", layout=(2, 1), xaxis=:log10)
```
"""
struct DielectricConstant{T<:Number} <: Dielectric
    eps_inf::T
end

(m::DielectricConstant)(omega) = m.eps_inf

eps_s(m::DielectricConstant) = m.eps_inf
eps_inf(m::DielectricConstant) = m.eps_inf


# Note: sign difference! https://en.m.wikipedia.org/wiki/Relative_permittivity#Lossy_medium
@doc raw"""
    DielectricModel(eps_inf, sigma)

The dielectric model includes perfect (lossless) dielectrics, conductive (lossy) materials, and perfect electric conductors.
```math
\varepsilon (\omega) = \varepsilon_\infty + \frac{\sigma}{\omega \varepsilon_0}
```

# Example
```@example
using Plots
plotlyjs()

using Permittivity

using PhysicalConstants.CODATA2018: ε_0
using Unitful: ustrip

eps_inf = 5.
sigma = 1. * ustrip(ε_0)

omega = exp10.(-2:.1:3)

m = DielectricModel(eps_inf, sigma)
ε = m.(omega)

plot(omega, [real(ε) imag(ε)], label=["Re(ε(ω))" "Im(ε(ω))"], xlabel="Frequency", layout=(2, 1), xaxis=:log10)
```
"""
struct DielectricModel{T<:AbstractFloat} <: Dielectric
    eps_inf::T
    sigma::T
end

(m::DielectricModel)(omega) = m.eps_inf + im * m.sigma / (omega * ustrip(ε_0))

eps_s(m::DielectricModel) = m.eps_inf
eps_inf(m::DielectricModel) = m.eps_inf


@doc raw"""
    DebyeModel(eps_s, eps_inf, tau)

The Debye relaxation is the dielectric relaxation response of an ideal, noninteracting population of dipoles to an alternating external electric field. It can also describes the relaxation of atomic vibrations.
```math
\varepsilon (\omega) = \varepsilon_\infty  + \frac{\varepsilon_s - \varepsilon_\infty}{1 + j \omega \tau},
```
where
- ``\varepsilon_s`` is a static (low frequency) dielectric permittivity,
- ``\varepsilon_\infty`` is permittivity at high frequency limit (optical permittivity),
- ``\tau = \frac{1}{\omega_r}`` is the characteristic relaxation time,
- ``\omega_r`` is relaxation frequency.

Separating into the real part ``\varepsilon'`` and the imaginary part ``\varepsilon''`` of the complex dielectric permittivity yields:
```math
\begin{align*}
    \varepsilon' &= \varepsilon_\infty + \frac{\varepsilon_s - \varepsilon_\infty}{1 + \omega^2 \tau^2} \\
    \varepsilon'' &= \frac{(\varepsilon_s - \varepsilon_\infty) \omega \tau}{1 + \omega^2 \tau^2}
\end{align*}
```

# Example
```julia-repl
using Plots # hide

eps_s = 10.
eps_inf = 5.
tau = 1.

omega = exp10.(-2:.1:3)

m = DebyeModel(eps_s, eps_inf, tau)
ε = m.(omega)

plot(omega, [real(ε) imag(ε)], label=["Re(ε(ω))" "Im(ε(ω))"], xlabel="Frequency", layout=(2, 1), xaxis=:log10);
```
"""
struct DebyeModel{T<:AbstractFloat} <: Dispersive
    eps_s::T
    eps_inf::T
    tau::T
end

(m::DebyeModel)(omega) = m.eps_inf + (m.eps_s - m.eps_inf) / (1 - im * omega * m.tau);

eps_s(m::DebyeModel) = m.eps_s
eps_inf(m::DebyeModel) = m.eps_inf

@doc raw"""
    ColeColeModel(eps_s, eps_inf, tau, alpha)

The Cole–Cole equation is a relaxation model that is often used to describe dielectric relaxation in polymers.

The complex dielectric constant is given by the equation
```math
\varepsilon(\omega) = \varepsilon_\infty + \frac{\varepsilon_s - \varepsilon_\infty}{1 + (j \omega\tau)^{\alpha}}
```
where
- ``\varepsilon_s`` and ``\varepsilon_\infty`` are the "static" and "infinite frequency" dielectric constants,
- ``\omega`` is the angular frequency,
- ``\tau`` is a time constant and
- ``\alpha`` is the exponent parameter.

The exponent parameter ``\alpha``, which takes a value between 0 and 1, allows the description of different spectral shapes. When ``\alpha=1``, the Cole-Cole model reduces to the Debye model. When ``\alpha<0``, the relaxation is ''stretched''. That is, it extends over a wider range on a logarithmic ``\omega`` scale than Debye relaxation.

# Example
```julia-repl
eps_s = 10.
eps_inf = 5.
tau = 1.
alpha = 0.8

omega = exp10.(-2:.1:3)

m = ColeColeModel(eps_s, eps_inf, tau, alpha)
ε = m.(omega)

plot(omega, [real(ε) imag(ε)], label=["Re(ε(ω))" "Im(ε(ω))"], xlabel="Frequency", layout=(2, 1), xaxis=:log10)
```

"""
struct ColeColeModel{T<:AbstractFloat} <: Dispersive
    eps_s::T
    eps_inf::T
    tau::T
    alpha::T
end

(m::ColeColeModel)(omega) = m.eps_inf + (m.eps_s - m.eps_inf) / (1 - (im * omega * m.tau)^m.alpha)

eps_s(m::ColeColeModel) = m.eps_s
eps_inf(m::ColeColeModel) = m.eps_inf


@doc raw"""
    ColeDavidson(eps_s, eps_inf, tau, beta)

The Cole-Davidson relaxation is an empirical modification of the Debye relaxation model in electromagnetism.

```math
\varepsilon(\omega) = \varepsilon_{\infty} + \frac{\varepsilon_{s} - \varepsilon_{\infty}}{(1 + j \omega \tau)^{\beta}},
```
where
- ``\varepsilon_{\infty}`` is the permittivity at the high frequency limit,
- ``\varepsilon_{s}`` is the static, low frequency permittivity,
- ``\tau`` is the characteristic relaxation time of the medium and
- ``\beta`` paramteres of the asymmetry.

# Example
```julia-repl
eps_s = 10.
eps_inf = 5.
tau = 1.
beta = 0.6

omega = exp10.(-2:.1:3)

m = ColeDavidson(eps_s, eps_inf, tau, beta)
ε = m.(omega)

plot(omega, [real(ε) imag(ε)], label=["Re(ε(ω))" "Im(ε(ω))"], xlabel="Frequency", layout=(2, 1), xaxis=:log10)
```

"""
struct ColeDavidson{T<:AbstractFloat} <: Dispersive
    eps_s::T
    eps_inf::T
    tau::T
    beta::T
end

(m::ColeDavidson)(omega) = m.eps_inf + (m.eps_s - m.eps_inf) / (1 - im * omega * m.tau)^m.beta

eps_s(m::ColeDavidson) = m.eps_s
eps_inf(m::ColeDavidson) = m.eps_inf


@doc raw"""
    HavriliakNegamiModel(eps_s, eps_inf, tau, alpha, beta)

The Havriliak–Negami relaxation is an empirical modification of the Debye relaxation model in electromagnetism. Unlike the Debye model, the Havriliak–Negami relaxation accounts for the asymmetry and broadness of the dielectric dispersion curve. The model was first used to describe the dielectric relaxation of some polymers, by adding two exponential parameters to the Debye equation:

```math
\hat{\varepsilon}(\omega) = \varepsilon_{\infty} + \frac{\varepsilon_{s} - \varepsilon_{\infty}}{(1 + (j\omega\tau)^{\alpha})^{\beta}},
```
where
- ``\varepsilon_{\infty}`` is the permittivity at the high frequency limit,
- ``\varepsilon_{s}`` is the static, low frequency permittivity,
- ``\tau`` is the characteristic relaxation time of the medium and
- ``\alpha`` and ``\beta`` paramteres of the broadness and asymmetry.

The terms ``\alpha`` and ``\beta`` are empirical parameters and their values are between ``0`` and ``1``.
- ``\alpha`` is a damping factor (broaden the dispersion) and describes the degree of flatness of the relaxation region.
- ``\beta`` is an asymmetric factor and describes relaxation properties asymmetric around relaxation frequency

Depending on application, the Fourier transform of the stretched exponential function can be a viable alternative that has one parameter less.

For ``\beta = 1`` the Havriliak–Negami equation reduces to the Cole–Cole equation, for ``\alpha=1`` to the Cole–Davidson equation.

# Examples
```julia-repl
eps_s = 10.
eps_inf = 5.
tau = 1.
alpha = .8
beta = .6

omega = exp10.(-2:.1:3)

m = HavriliakNegamiModel(eps_s, eps_inf, tau, alpha, beta)
ε = m.(omega)

plot(omega, [real(ε) imag(ε)], label=["Re(ε(ω))" "Im(ε(ω))"], xlabel="Frequency", layout=(2, 1), xaxis=:log10)
```
"""
struct HavriliakNegamiModel{T<:AbstractFloat} <: Dispersive
    eps_s::T
    eps_inf::T
    tau::T
    alpha::T
    beta::T
end

(m::HavriliakNegamiModel)(omega) = m.eps_inf + (m.eps_s - m.eps_inf) / (1 - (im * omega * m.tau)^m.alpha)^m.beta

eps_s(m::HavriliakNegamiModel) = m.eps_s
eps_inf(m::HavriliakNegamiModel) = m.eps_inf


@doc raw"""
    FreeElectronPlasmaModel(omega_p)

The Dielectric constant of free electron plasma:
```math
\varepsilon (\omega) = 1 - \frac{\omega_p^2}{\omega^2}
```

# Example
```julia-repl
omega_p = 5.

omega = exp10.(-1:.1:2)

m = FreeElectronPlasmaModel(omega_p)
ε = m.(omega)

plot(omega, [real(ε) imag(ε)], label=["Re(ε(ω))" "Im(ε(ω))"], xlabel="Frequency", layout=(2, 1), xaxis=:log10)
```
"""
struct FreeElectronPlasmaModel <: Dispersive
    omega_p
end

(m::FreeElectronPlasmaModel)(omega) = 1 - m.omega_p^2 / omega^2;

eps_s(::FreeElectronPlasmaModel) = -Inf
eps_inf(::FreeElectronPlasmaModel) = 1


@doc raw"""
    DrudeModel(eps_inf, omega_p, gamma)

The Drude model describes intraband electron motion.
```math
\varepsilon (\omega) = 1 - \frac{\omega_p^2}{\omega^2 + j \omega \gamma}
```

note:
- ``\gamma = \Gamma = \tau^{-1}``
- Lorentz mode wit ``\omega_0=0``

# Example
```julia
eps_inf = 5.
omega_p = 5.
gamma = 1.

omega = exp10.(-1:.01:2)

m = DrudeModel(eps_inf, omega_p, gamma)
ε = m.(omega)

plot(omega, [real(ε) imag(ε)], label=["Re(ε(ω))" "Im(ε(ω))"], xlabel="Frequency", layout=(2, 1), xaxis=:log10)
```
"""
struct DrudeModel{T<:AbstractFloat}
    eps_inf::T
    omega_p::T
    gamma::T
end

(m::DrudeModel)(omega) = m.eps_inf - m.omega_p^2 / (omega^2 + im * m.gamma * omega);

eps_s(m::DrudeModel) = m.eps_inf - m.omega_p^2 / m.gamma^2 + im * Inf
eps_inf(m::DrudeModel) = m.eps_inf

realroot(m::DrudeModel) = sqrt(m.omega_p^2 / m.eps_inf - m.gamma^2)


@doc raw"""
    LorentzModel(eps_s, eps_inf, omega_0, gamma)

The Lorentz oscillator model describes interband electron transitions.

```math
\varepsilon (\omega) = \varepsilon_\infty + \frac{(\varepsilon_s - \varepsilon_\infty) \omega_0^2}{\omega_0^2  - \omega^2 - j \omega\Gamma}
```

# Example:
```julia-repl
eps_s = 10.
eps_inf = 5.
omega_0 = 1.
gamma = .5

omega = exp10.(-1:.01:2)

m = LorentzModel(eps_s, eps_inf, omega_0, gamma)
ε = m.(omega)

plot(omega, [real(ε) imag(ε)], label=["Re(ε(ω))" "Im(ε(ω))"], xlabel="Frequency", layout=(2, 1), xaxis=:log10)

@show Permittivity.eps_s(m) real(ε)[1]
@show Permittivity.eps_inf(m) real(ε)[end]
@show Permittivity.peak(m) maximum(imag(ε))

# omega = 0.1:.01:5
# m = LorentzModel(eps_s, eps_inf, omega_0, gamma)
# ε = m.(omega)
# plot(omega, [real(ε) imag(ε)], label=["Re(ε(ω))" "Im(ε(ω))"], xlabel="Frequency", layout=(2, 1))
```
"""

struct LorentzModel{T<:AbstractFloat}
    eps_s::T
    eps_inf::T
    omega_0::T
    gamma::T
end

(m::LorentzModel)(omega) = m.eps_inf + (m.eps_s - m.eps_inf) * m.omega_0^2 / (m.omega_0^2 - omega^2 - im * omega * m.gamma);

# static ε (low frequency)
eps_s(m::LorentzModel) = m.eps_s

# ε at high frequency
eps_inf(m::LorentzModel) = m.eps_inf

# Absorption peak (imaginary part)
peak(m::LorentzModel) = (m.eps_s - m.eps_inf) * m.omega_0 / m.gamma

# TODO: caluclate omega_p (plasmon frequency)

