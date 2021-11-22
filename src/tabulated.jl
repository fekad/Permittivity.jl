@doc raw"""
    PermittivityTable(omega, eps)

Interpolate values between tabulated data points.
"""
struct PermittivityTable <: Tabulated
    omega::Vector{Float64}
    eps::Vector{ComplexF64}
    _itp_real::Spline1D
    _itp_imag::Spline1D

    function PermittivityTable(omega::Vector{Float64}, eps::Vector{ComplexF64})

        inds = sortperm(omega)

        itp_real = Spline1D(omega[inds], real(eps[inds]))
        itp_imag = Spline1D(omega[inds], imag(eps[inds]))

        # itp_real = interpolate((omega[inds],), real(eps[inds]), Gridded(Linear()))
        # itp_imag = interpolate((omega[inds],), imag(eps[inds]), Gridded(Linear()))

        new(omega, eps, itp_real, itp_imag)
    end
end

(e::PermittivityTable)(omega) = e._itp_real(omega) + e._itp_imag(omega) * im

