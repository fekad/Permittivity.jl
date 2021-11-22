
# # Interpolated frequency dependent permitivirty
# struct PermittivityTable <: TablePermittivity
#     lambda::Vector{Float64}
#     eps::Vector{ComplexF64}
#     itp_real::Spline1D
#     itp_imag::Spline1D
#     function PermittivityTable(lambda::Vector{Float64}, eps::Vector{ComplexF64})
#
#         inds = sortperm(lambda)
#         # itp_real = interpolate((lambda[inds],), real(eps[inds]), Gridded(Linear()))
#         # itp_imag = interpolate((lambda[inds],), imag(eps[inds]), Gridded(Linear()))
#
#         itp_real = Spline1D(lambda[inds], real(eps[inds]))
#         itp_imag = Spline1D(lambda[inds], imag(eps[inds]))
#
#         new(lambda, eps, itp_real, itp_imag)
#     end
# end
#
# permittivity(e::PermittivityTable, lambda) = e.itp_real(lambda) + e.itp_imag(lambda) * im
#
# # TODO: proper broadcasting
# reflective_index(e::AbstractPermittivity, lambda) = sqrt(permittivity(e, lambda))
#