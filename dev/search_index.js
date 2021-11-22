var documenterSearchIndex = {"docs":
[{"location":"composite/#Models-with-arbitrary-accuracy","page":"Composites","title":"Models with arbitrary accuracy","text":"","category":"section"},{"location":"composite/","page":"Composites","title":"Composites","text":"Modules = [Permittivity]\nPages = [\"composite.jl\", \"tabulated.jl\"]","category":"page"},{"location":"composite/#Permittivity.MultiLorentzPoleModel","page":"Composites","title":"Permittivity.MultiLorentzPoleModel","text":"MultiLorentzPoleModel(eps_inf, eps, omega_p, delta)\n\nThe Drude model in combination with multiple Lorentz oscillator poles:\n\nvarepsilon (omega) = varepsilon_infty  + sum limits_N fracDeltavarepsilon omega_p^2omega_p^2 - omega(omega + j 2delta)\n\n\n\n\n\n","category":"type"},{"location":"composite/#Permittivity.MultiPoleDebyeModel","page":"Composites","title":"Permittivity.MultiPoleDebyeModel","text":"MultiPoleDebyeModel(eps_inf, sigma, eps, tau)\n\nThe multi-pole Debye model with static conductivity:\n\nvarepsilon (omega) = varepsilon_infty  + sum limits_i^N fracDeltavarepsilon_i1 + j omega tau_i + fracsigma_sj omega varepsilon_0\n\nwhere\n\nsigma_s the static conductivity\nDeltavarepsilon_i is the change in permittivity due to the ith dispersion\n\n\n\n\n\n","category":"type"},{"location":"composite/#Permittivity.PermittivityTable","page":"Composites","title":"Permittivity.PermittivityTable","text":"PermittivityTable(omega, eps)\n\nInterpolate values between tabulated data points.\n\n\n\n\n\n","category":"type"},{"location":"model/#Models","page":"Models","title":"Models","text":"","category":"section"},{"location":"model/","page":"Models","title":"Models","text":"Modules = [Permittivity]\nPages = [\"models.jl\"]","category":"page"},{"location":"#Permittivity","page":"Home","title":"Permittivity","text":"","category":"section"},{"location":"#Material-models","page":"Home","title":"Material models","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Permittivity\nElectric susceptibility","category":"page"},{"location":"","page":"Home","title":"Home","text":"source article","category":"page"},{"location":"#Dielectrics-Materials","page":"Home","title":"Dielectrics Materials","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Dielectrics and Conductors: This includes perfect (lossless) dielectrics, conductive (lossy) materials, and perfect electric conductors.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Dielectric constant","category":"page"},{"location":"#Dispersive-Materials","page":"Home","title":"Dispersive Materials","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Dispersive (frequency-dependent) materials can correctly describe the physics behind the optical responses.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Dielectric constant of free electron gas\nDrude model: describes intraband electron motion.\nLorentz oscillator model: describes interband electron transitions.\nDebye model: describes the relaxation of atomic vibrations.\nCole–Cole model\nCole-Davidson\nHavriliak-Negami","category":"page"},{"location":"#Arbitrarily-accurate-Models","page":"Home","title":"Arbitrarily-accurate Models","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The arbitrarily-accurate (albeit, perhaps unphysical) fits to experimental optical data can be obtained.","category":"page"},{"location":"","page":"Home","title":"Home","text":"multi-pole Debye model with static conductivity\nDrude model in combination with multiple Lorentz oscillator poles\nInterpolation of tabulated data","category":"page"},{"location":"#Examples","page":"Home","title":"Examples","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"julia> using Permittivity\n","category":"page"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"}]
}
