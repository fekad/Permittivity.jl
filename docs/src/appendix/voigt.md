
# The Voigt profile

source: [https://en.wikipedia.org/wiki/Voigt_profile](https://en.wikipedia.org/wiki/Voigt_profile)

Without loss of generality, we can consider only centered profiles, which peak at zero. The Voigt profile is then
```math
V(x;\sigma,\gamma) \equiv \int_{-\infty}^\infty G(x';\sigma)L(x-x';\gamma)\, dx',
```

where $x$ is the shift from the line center, $G(x;\sigma)$ is the centered Gaussian profile:

```math
G(x;\sigma) \equiv \frac{e^{-x^2/(2\sigma^2)}}{\sigma \sqrt{2\pi}},
```

and $L(x;\gamma)$ is the centered Lorentzian profile:

```math
L(x;\gamma) \equiv \frac{\gamma}{\pi(x^2+\gamma^2)}.
```

The defining integral can be evaluated as:

```math
V(x;\sigma,\gamma)=\frac{\operatorname{Re}[w(z)]}{\sigma\sqrt{2 \pi}},
```

where $\operatorname{Re}[w(z)]$ is the real part of the Faddeeva function evaluated for
```math
z=\frac{x+i\gamma}{\sigma\sqrt{2}}.
```


source: [https://scipython.com/book/chapter-8-scipy/examples/the-voigt-profile/](https://scipython.com/book/chapter-8-scipy/examples/the-voigt-profile/)

The Voigt line profile occurs in the modelling and analysis of radiative transfer in the atmosphere. It is the convolution of a Gaussian profile, $G(x; \sigma)$ and a Lorentzian profile, $ L(x; \gamma)$:
```math
V(x; \sigma, \gamma) = \int_{-\infty}^\infty G(x';\sigma)L(x-x';\gamma)\,\mathrm{d}x'
```
where
```math
G(x;\sigma) = \frac{1}{\sigma\sqrt{2\pi}}\exp\left(-\frac{x^2}{2\sigma^2}\right) \quad \mathrm{and}\quad L(x;\gamma) = \frac{\gamma/\pi}{x^2 + \gamma^2}.
```

Here $\gamma$ is the half-width at half-maximum (HWHM) of the Lorentzian profile and $\sigma$ is the standard deviation of the Gaussian profile, related to its HWHM, $\alpha$, by $\alpha = \sigma\sqrt{2\ln 2}$. In terms of frequency, $\nu$, $x = \nu - \nu_0$ where $\nu_0$ is the line centre.

There is no closed form for the Voigt profile, but it is related to the real part of the Faddeeva function, $w(z)$ by
```math
V(x;\sigma,\gamma) = \frac{\renewcommand\Re{\operatorname{Re}}\Re{[w(z)]}}{\sigma\sqrt{2\pi}}, \;\mathrm{where}\;z = \frac{x + i\gamma}{\sigma\sqrt{2}}.
```
The program below plots the Voigt profile for $\gamma = 0.1$, $\alpha = 0.1$ and compares it with the corresponding Gaussian and Lorentzian profiles. The equations above are implemented in the three functions, $G$, $L$ and $V$ defined in the code below.

```@example 1
using SpecialFunctions: erfcx
using Plots
gr() # hide
nothing # hide
```

```@example 1
""" The Faddeeva function """
w(x) = erfcx(-im*x)

""" Return Gaussian line shape at x with HWHM alpha """
function G(x, alpha)
    return sqrt(log(2) / pi) / alpha * exp(-(x / alpha)^2 * log(2))
end

""" Return Lorentzian line shape at x with HWHM gamma """
function L(x, gamma)
    return gamma / pi / (x^2 + gamma^2)
end

""" Return the Voigt line shape at x with Lorentzian component HWHM gamma
and Gaussian component HWHM alpha. """
function V(x, alpha, gamma)
    sigma = alpha / sqrt(2 * log(2))

    return real(w((x + im * gamma) / sigma / sqrt(2))) / sigma / sqrt(2 * pi)
    return w((x + im * gamma) / (sigma * sqrt(2))) / (sigma * sqrt(2 * pi))
end
nothing # hide
```

```@example 1
alpha, gamma = 0.1, 0.1

xx = LinRange(-0.8, 0.8, 1001)
plot(xx, G.(xx, alpha), label="Gaussian")
plot!(xx, L.(xx, gamma), label="Lorentzian")
plot!(xx, V.(xx, alpha, gamma), label="Voigt")
```

```@example 1
alpha, gamma = 0.1, 0.1

xx = LinRange(-0.8, 0.8, 1001)
plot(xx, G.(xx, alpha), label="Gaussian")
plot!(xx, L.(xx, gamma), label="Lorentzian")
plot!(xx, V.(xx, alpha, gamma), label="Voigt")
```

In the limiting cases of $\sigma=0$ and $\gamma=0$ then $V(x;\sigma,\gamma)$ simplifies to $L(x;\gamma)$ and $G(x;\sigma)$, respectively.

```@example 1
b_list = [.2 .4 .8]
alpha′, gamma′ = b_list * alpha, (1 .- b_list) * gamma

xx = LinRange(-0.8, 0.8, 1001)
plot(xx, G.(xx, alpha), label="Gaussian")
plot!(xx, L.(xx, gamma), label="Lorentzian")
plot!(xx, V.(xx, alpha′, gamma′), label=["Voigt b=$b" for b in b_list])
```

## Properties

The Voigt profile is normalized:
```math
  \int_{-\infty}^\infty V(x;\sigma,\gamma)\,dx = 1,
```
since it is a convolution of normalized profiles. The Lorentzian profile has no moments (other than the zeroth), and so the moment-generating function for the Cauchy distribution is not defined. It follows that the Voigt profile will not have a moment-generating function either, but the characteristic function for the Cauchy distribution is well defined, as is the characteristic function for the normal distribution.  The characteristic function for the (centered) Voigt profile will then be the product of the two:

```math
  \varphi_f(t;\sigma,\gamma) = E(e^{ixt}) = e^{-\sigma^2t^2/2 - \gamma |t|}.
```

Since normal distributions and Cauchy distributions are stable distributions, they are each closed under convolution (up to change of scale), and it follows that the Voigt distributions are also closed under convolution.


```@example 1
""" Return the Complex Voigt line shape at x with Lorentzian component HWHM gamma
and Gaussian component HWHM alpha. """
function V_complex(x, alpha, gamma)
    sigma = alpha / sqrt(2 * log(2))

    return w((x + im * gamma) / (sigma * sqrt(2))) / (sigma * sqrt(2 * pi))
end

alpha, gamma = 0.1, 0.1
xx = LinRange(-0.8, 0.8, 1001)
plot(
    plot(xx, real(V_complex.(xx, alpha, gamma)), label="real"),
    plot(xx, imag(V_complex.(xx, alpha, gamma)), label="imag"),
    layout =(2,1)
)
```
