var documenterSearchIndex = {"docs":
[{"location":"composite/#Models-with-arbitrary-accuracy","page":"Composites","title":"Models with arbitrary accuracy","text":"","category":"section"},{"location":"composite/","page":"Composites","title":"Composites","text":"Modules = [Permittivity]\nPages = [\"composite.jl\", \"tabulated.jl\"]","category":"page"},{"location":"composite/#Permittivity.MultiLorentzPoleModel","page":"Composites","title":"Permittivity.MultiLorentzPoleModel","text":"MultiLorentzPoleModel(eps_inf, eps, omega_p, delta)\n\nThe Drude model in combination with multiple Lorentz oscillator poles:\n\nvarepsilon (omega) = varepsilon_infty  + sum limits_N fracDeltavarepsilon omega_p^2omega_p^2 - omega(omega + j 2delta)\n\n\n\n\n\n","category":"type"},{"location":"composite/#Permittivity.MultiPoleDebyeModel","page":"Composites","title":"Permittivity.MultiPoleDebyeModel","text":"MultiPoleDebyeModel(eps_inf, sigma, eps, tau)\n\nThe multi-pole Debye model with static conductivity:\n\nvarepsilon (omega) = varepsilon_infty  + sum limits_i^N fracDeltavarepsilon_i1 + j omega tau_i + fracsigma_sj omega varepsilon_0\n\nwhere\n\nsigma_s the static conductivity\nDeltavarepsilon_i is the change in permittivity due to the ith dispersion\n\n\n\n\n\n","category":"type"},{"location":"composite/#Permittivity.PermittivityTable","page":"Composites","title":"Permittivity.PermittivityTable","text":"PermittivityTable(omega, eps)\n\nInterpolate values between tabulated data points.\n\n\n\n\n\n","category":"type"},{"location":"model/#Models","page":"Models","title":"Models","text":"","category":"section"},{"location":"model/","page":"Models","title":"Models","text":"Modules = [Permittivity]\nPages = [\"model.jl\"]","category":"page"},{"location":"model/#Permittivity.ColeColeModel","page":"Models","title":"Permittivity.ColeColeModel","text":"ColeColeModel(eps_s, eps_inf, tau, alpha)\n\nThe Cole–Cole equation is a relaxation model that is often used to describe dielectric relaxation in polymers.\n\nThe complex dielectric constant is given by the equation\n\nvarepsilon(omega) = varepsilon_infty + fracvarepsilon_s - varepsilon_infty1 + (j omegatau)^1 - alpha\n\nwhere\n\nvarepsilon_s and varepsilon_infty are the \"static\" and \"infinite frequency\" dielectric constants,\nomega is the angular frequency,\ntau is a time constant and\nalpha is the exponent parameter.\n\nThe exponent parameter alpha, which takes a value between 0 and 1, allows the description of different spectral shapes. When alpha=0, the Cole-Cole model reduces to the Debye model. When alpha0, the relaxation is ''stretched''. That is, it extends over a wider range on a logarithmic omega scale than Debye relaxation.\n\n\n\n\n\n","category":"type"},{"location":"model/#Permittivity.ColeDavidson","page":"Models","title":"Permittivity.ColeDavidson","text":"ColeDavidson(eps_s, eps_inf, tau, beta)\n\nThe Cole-Davidson relaxation is an empirical modification of the Debye relaxation model in electromagnetism.\n\nvarepsilon(omega) = varepsilon_infty + fracvarepsilon_s - varepsilon_infty(1 + j omega tau)^beta\n\nwhere\n\nvarepsilon_infty is the permittivity at the high frequency limit,\nvarepsilon_s is the static, low frequency permittivity,\ntau is the characteristic relaxation time of the medium and\nbeta paramteres of the asymmetry.\n\n\n\n\n\n","category":"type"},{"location":"model/#Permittivity.DebyeModel","page":"Models","title":"Permittivity.DebyeModel","text":"DebyeModel(eps_s, eps_inf, tau)\n\nThe Debye relaxation is the dielectric relaxation response of an ideal, noninteracting population of dipoles to an alternating external electric field. It can also describes the relaxation of atomic vibrations.\n\nvarepsilon (omega) = varepsilon_infty  + fracvarepsilon_s - varepsilon_infty1 + j omega tau\n\nwhere\n\nvarepsilon_s is a static (low frequency) dielectric permittivity,\nvarepsilon_infty is permittivity at high frequency limit (optical permittivity),\ntau = frac1omega_r is the characteristic relaxation time,\nomega_r is relaxation frequency.\n\nSeparating into the real part varepsilon and the imaginary part varepsilon of the complex dielectric permittivity yields:\n\nbeginalign\n   varepsilon = varepsilon_infty + fracvarepsilon_s - varepsilon_infty1 + omega^2tau^2 3pt\n  varepsilon = frac(varepsilon_s - varepsilon_infty)omegatau1+omega^2tau^2\nendalign\n\nExample:\n\n# omega = 0:.1:10\nomega = exp10.(-2:.1:2)\neps_s = 6.\neps_inf = 0.\ntau = 1.\n\nm = DebyeModel(eps_s, eps_inf, tau)\nε = permittivity.(m, omega)\n\nplot(omega, [real(ε) imag(ε)], label=[\"Re(ε(ω))\" \"Im(ε(ω))\"], layout=(2, 1) ,)\n\n\n\n\n\n","category":"type"},{"location":"model/#Permittivity.DielectricConstant","page":"Models","title":"Permittivity.DielectricConstant","text":"DielectricConstant(eps)\n\nThe dielectric constant:\n\nvarepsilon (omega) = varepsilon\n\nwhere varepsilon can be real or complex value.\n\nExample:\n\nomega = 0:.1:10\nmodel = DielectricConstant(1.)\n\nε = model.(omega)\n\nplot(omega, real(ε), label=\"Re(ε(ω))\")\n\n\n\n\n\n","category":"type"},{"location":"model/#Permittivity.DielectricModel","page":"Models","title":"Permittivity.DielectricModel","text":"DielectricModel(eps_inf, sigma)\n\nThe dielectric model includes perfect (lossless) dielectrics, conductive (lossy) materials, and perfect electric conductors.\n\nvarepsilon (omega) = varepsilon_infty + fracsigmaj omega varepsilon_0\n\nvarepsilon (omega) = varepsilon_infty + fracsigmaj omega = varepsilon_infty -j fracsigmaomega\n\nExample:\n\nomega = 0:.1:10\nmodel = DielectricModel(1., 1.)\n\nε = model.(omega)\n\n# plot(omega, [real(ε) imag(ε)], label=[\"Re(ε(ω))\" \"Im(ε(ω))\"], layout=(2,1))\np1 = plot(omega, real(ε), label=\"Re(ε(ω))\")\np2 = plot(omega, imag(ε), label=\"Im(ε(ω))\", legend=:bottomright)\nplot(p1, p2, layout = @layout [a; b])\n\n\n\n\n\n","category":"type"},{"location":"model/#Permittivity.DrudeModel","page":"Models","title":"Permittivity.DrudeModel","text":"DrudeModel(omega_p, gamma)\n\nThe Drude model describes intraband electron motion.\n\nvarepsilon (omega) = 1 - fracomega_p^2omega^2 + j omega gamma\n\nnote:\n\ngamma = Gamma = tau^-1\nLorentz mode wit omega_0=0\n\nExample:\n\nomega = 0:.01:10\nomega_p = 3.\ngamma = 1.\n\nm = DrudeModel(omega_p, gamma)\nε = permittivity.(m, omega)\n\n# plot(omega, [real(ε) imag(ε)], label=[\"Re(ε(ω))\" \"Im(ε(ω))\"], layout=(2,1) )\np1 = plot(omega, real(ε), label=\"Re(ε(ω))\", legend=:bottomright)\np2 = plot(omega, imag(ε), label=\"Im(ε(ω))\")\nplot(p1, p2, layout = @layout [a; b])\n\n\n\n\n\n","category":"type"},{"location":"model/#Permittivity.FreeElectronPlasmaModel","page":"Models","title":"Permittivity.FreeElectronPlasmaModel","text":"FreeElectronPlasmaModel(omega_p)\n\nThe Dielectric constant of free electron plasma:\n\nvarepsilon (omega) = 1 - fracomega_p^2omega^2\n\nExample:\n\nomega = 0:.1:10\nomega_p = 3.\ngamma = 1.\n\nm = FreeElectronPlasmaModel(omega_p)\nε = permittivity.(m, omega)\n\nplot(omega, ε, label=\"Re(ε(ω))\", ylimits=[-5, 1], legend=:bottomright)\n\n\n\n\n\n","category":"type"},{"location":"model/#Permittivity.HavriliakNegamiModel","page":"Models","title":"Permittivity.HavriliakNegamiModel","text":"HavriliakNegamiModel(eps_s, eps_inf, tau, alpha, beta)\n\nThe Havriliak–Negami relaxation is an empirical modification of the Debye relaxation model in electromagnetism. Unlike the Debye model, the Havriliak–Negami relaxation accounts for the asymmetry and broadness of the dielectric dispersion curve. The model was first used to describe the dielectric relaxation of some polymers, by adding two exponential parameters to the Debye equation:\n\nhatvarepsilon(omega) = varepsilon_infty + fracvarepsilon_s - varepsilon_infty(1 + (jomegatau)^alpha)^beta\n\nwhere\n\nvarepsilon_infty is the permittivity at the high frequency limit,\nvarepsilon_s is the static, low frequency permittivity,\ntau is the characteristic relaxation time of the medium and\nalpha and beta paramteres of the broadness and asymmetry.\n\nThe terms alpha and beta are empirical parameters and their values are between 0 and 1.\n\nalpha is a damping factor (broaden the dispersion) and describes the degree of flatness of the relaxation region.\nbeta is an asymmetric factor and describes relaxation properties asymmetric around relaxation frequency\n\nDepending on application, the Fourier transform of the stretched exponential function can be a viable alternative that has one parameter less.\n\nFor beta = 1 the Havriliak–Negami equation reduces to the Cole–Cole equation, for alpha=1 to the Cole–Davidson equation.\n\n\n\n\n\n","category":"type"},{"location":"#Permittivity","page":"Home","title":"Permittivity","text":"","category":"section"},{"location":"#Material-models","page":"Home","title":"Material models","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Permittivity\nElectric susceptibility","category":"page"},{"location":"","page":"Home","title":"Home","text":"source article","category":"page"},{"location":"#Dielectrics-Materials","page":"Home","title":"Dielectrics Materials","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Dielectrics and Conductors: This includes perfect (lossless) dielectrics, conductive (lossy) materials, and perfect electric conductors.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Dielectric constant","category":"page"},{"location":"#Dispersive-Materials","page":"Home","title":"Dispersive Materials","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Dispersive (frequency-dependent) materials can correctly describe the physics behind the optical responses.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Dielectric constant of free electron gas\nDrude model: describes intraband electron motion.\nLorentz oscillator model: describes interband electron transitions.\nDebye model: describes the relaxation of atomic vibrations.\nCole–Cole model\nCole-Davidson\nHavriliak-Negami","category":"page"},{"location":"#Arbitrarily-accurate-Models","page":"Home","title":"Arbitrarily-accurate Models","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The arbitrarily-accurate (albeit, perhaps unphysical) fits to experimental optical data can be obtained.","category":"page"},{"location":"","page":"Home","title":"Home","text":"multi-pole Debye model with static conductivity\nDrude model in combination with multiple Lorentz oscillator poles\nInterpolation of tabulated data","category":"page"},{"location":"#Examples","page":"Home","title":"Examples","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"julia> using Permittivity\n","category":"page"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"}]
}