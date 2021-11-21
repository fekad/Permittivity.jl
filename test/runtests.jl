using Test
using Permittivity


@testset "Permittivity.jl" begin

    @testset "Tabular data" begin
        @test isapprox(1., 1., rtol=1e-6)
    end


end

