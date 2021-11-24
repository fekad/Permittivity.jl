# Gaussian function (Normal distribution)

Gaussian functions are often used to represent the probability density function of a normally distributed random variable with expected value $\mu$ and variance $\sigma^2$. In this case, the Gaussian is of the form:

```math
g(x)={\frac {1}{\sigma {\sqrt {2\pi }}}}\exp {\left(-{\frac {1}{2}}{\frac {(x-\mu )^{2}}{\sigma ^{2}}}\right)}.
```


## Multi-dimensional Gaussian function (Multivariate normal distribution)

In an $n$-dimensional space a Gaussian function can be defined as
```math
f(x) = \exp(-x^TCx) \;,
```
where $x=\{x_1,\dots,x_n\}$ is a column of $n$ coordinates, $C$ is a [[positive-definite matrix|positive-definite]] $n\times n$ matrix, and ${}^T$ denotes [[transpose|matrix transposition]].

The integral of this Gaussian function over the whole $n$-dimensional space is given as
```math
\int_{\mathbb{R}^n} \exp(-x^TCx) \, dx = \sqrt{\frac{\pi^n}{\det C}} \;.
```
It can be easily calculated by diagonalizing the matrix $C$ and changing the integration variables to the eigenvectors of  $C$.

More generally a shifted Gaussian function is defined as
```math
f(x) = \exp(-x^TCx+s^Tx) \;,
```
where $s=\{s_1,\dots,s_n\}$ is the shift vector and the matrix $C$ can be assumed to be symmetric, $C^T=C$, and positive-definite.

```math
\varphi(\xi; x_0, \gamma) =  e^{i x_0 \xi} \cdot e^{- \gamma \xi^2}
```

```@example 1
using Plots
gr() # hide
nothing # hide
```

```@example 1
Gaussian(x, μ, σ) = 1 / (σ * sqrt(2π)) * exp(-1/2 * (x - μ)^2 / σ^2)

μ, σ = 6, .5
X = LinRange(0,10,1001)
plot(X, Gaussian.(X, μ, σ))
```

```@example 1
phi(ξ, x₀, γ) = exp(- im * x₀ * ξ) * exp(-(γ * ξ)^2)

Ξ = LinRange(-2π, 2π, 1001)
plot(Ξ, phi.(Ξ, μ, σ))
```

```@example 1
plot(Ξ, abs.(phi.(Ξ, μ, σ)))
```
