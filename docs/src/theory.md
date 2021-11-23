# Permittivity

In electromagnetism, the permittivity is a measure of the electric polarizability of a dielectric.

The polarizability usually refers to the tendency of matter, when subjected to an electric field, to acquire an electric dipole moment in proportion to that applied field. It is a property of all matter, inasmuch as matter is made up of elementary particles which have an electric charge, namely protons and electrons. When subject to an electric field, the negatively charged electrons and positively charged atomic nuclei are subject to opposite forces and undergo charge separation.

The electric susceptibility (``\chi_{\text{e}}``) is a dimensionless proportionality constant that indicates the degree of polarization of a dielectric material in response to an applied electric field. The greater the electric susceptibility, the greater the ability of a material to polarize in response to the field, and thereby reduce the total electric field inside the material (and store energy).

## Definition for linear dielectrics

If a dielectric material is a linear, homogeneous and isotropic material with "instantaneous" response to changes in electric field, then the electric susceptibility is defined as the constant of proportionality relating an electric field ``\mathbf{E}`` to the induced dielectric polarization density ``\mathbf{P}`` such that:
```math
\mathbf{P} = \varepsilon_0 \chi_{\mathrm{e}} \mathbf{E},
```

where
- ``\mathbf{P}`` is the nduced dielectric polarization density,
- ``\varepsilon_0`` is the electric permittivity of free space (electric constant),
- ``\chi_{\mathrm{e}}`` is the electric susceptibility,
- ``\mathbf{E}`` is the electric field.


The susceptibility is related to its relative permittivity (dielectric constant) ``\varepsilon_{\textrm{r}}`` by
```math
\chi_{\text{e}}\ = \varepsilon_{\textrm{r}} - 1
```

so in the case of a vacuum ``\chi_{\textrm{e}}\ =  0``.


In electromagnetism, the electric displacement field ``\mathbf{D}`` represents the distribution of electric charges in a given medium resulting from the presence of an electric field ``\mathbf{E}``, which is related to the polarization density ``\mathbf{P} `` by the following relation:
```math
\mathbf{D} = \varepsilon_0\mathbf{E} + \mathbf{P} = \varepsilon_0 (1 + \chi_{\textrm{e}}) \mathbf{E} = \varepsilon_{\textrm{r}} \varepsilon_0 \mathbf{E} = \varepsilon\mathbf{E}
```

where
- ``\varepsilon = \varepsilon_{\textrm{r}} \varepsilon_0`` is the permittivity,
- ``\varepsilon_{\textrm{r}} = (1+\chi_{\textrm{e}})``  is the relative permittivity.

## Nonlinear/anisotropic susceptibility

In many materials the polarizability starts to saturate at high values of electric field. This saturation can be modelled by a nonlinear susceptibility. These susceptibilities are important in nonlinear optics and lead to effects such as second-harmonic generation (such as used to convert infrared light into visible light, in green laser pointers).

The standard definition of nonlinear susceptibilities in SI units is via a Taylor expansion of the polarization's reaction to electric field:
```math
 P = P_0 + \varepsilon_0 \chi^{(1)} E + \varepsilon_0 \chi^{(2)} E^2 + \varepsilon_0 \chi^{(3)} E^3 + \cdots.
 ```

(Except in ferroelectric materials, the built-in polarization is zero, ``P_0 = 0``.)
The first susceptibility term, ``\chi^{(1)}``, corresponds to the linear susceptibility described above. While this first term is dimensionless, the subsequent nonlinear susceptibilities ``\chi^{(n)}`` have units of ``(m/V)^{n−1}``.

The nonlinear susceptibilities can be generalized to anisotropic materials in which the susceptibility is not uniform in every direction.
In these materials, each susceptibility ``\chi^{(n)}`` becomes an ``(n + 1)``-degree tensor.

```mathEg: to describe anisotropic media a polarizability rank two tensor ``\alpha`` is defined,
\mathbb{\alpha} =
\begin{bmatrix}
\alpha_{xx} & \alpha_{xy} & \alpha_{xz} \\
\alpha_{yx} & \alpha_{yy} & \alpha_{yz} \\
\alpha_{zx} & \alpha_{zy} & \alpha_{zz} \\
\end{bmatrix}
```
The elements describing the response parallel to the applied electric field are those along the diagonal. A large value of ``\alpha_{yx}`` here means that an electric-field applied in the ``x``-direction would strongly polarize the material in the ``y``-direction. Explicit expressions for ``\alpha`` have been given for homogeneous anisotropic ellipsoidal bodies.

Many linear dielectrics are isotropic, but it is possible nevertheless for a material to display behavior that is both linear and anisotropic, or for a material to be non-linear but isotropic.
Anisotropic but linear susceptibility is common in many crystals.

In general, permittivity is not a constant, as it can vary with the position in the medium, the frequency of the field applied, humidity, temperature, and other parameters.

## Molecular polarizability

The polarizability of an atom or molecule is defined as the ratio of its induced dipole moment ``\mathbf{P}`` to the local electric field ``\mathbf{E}``; in a crystalline solid, one considers the dipole moment per unit cell.
This parameter is the molecular polarizability (``\alpha``), and the dipole moment resulting from the local electric field ``\mathbf{E}_{\mathrm{local}}`` is given by:
```math
\mathbf{p} = \varepsilon_0\alpha \mathbf{E_{\mathrm{local}}}
```

This introduces a complication however, as locally the field can differ significantly from the overall applied field. We have:
```math
\mathbf{P} = N \mathbf{p} = N \varepsilon_0 \alpha \mathbf{E}_\mathrm{local},
```

where ``\mathbf{P}`` is the polarization per unit volume, and ``N`` is the number of molecules per unit volume contributing to the polarization. Thus, if the local electric field is parallel to the ambient electric field, we have:
```math
\chi_{\mathrm{e}} \mathbf{E} = N \alpha \mathbf{E}_{\mathrm{local}}
```

Thus only if the local field equals the ambient field can we write:
```math
\chi_{\mathrm{e}} =  N \alpha.
```


Note that the local electric field seen by a molecule is generally different from the macroscopic electric field that would be measured externally.
This discrepancy is taken into account by the Clausius–Mossotti relation (below) which connects the bulk behaviour (polarization density due to an external electric field according to the electric susceptibility ``\chi = \varepsilon_{r}-1``) with the molecular polarizability ``\alpha`` due to the local field. In some materials, the Clausius–Mossotti relation holds and reads
```math
\frac{\chi_{\mathrm{e}}}{3+\chi_{\mathrm{e}}} =  \frac{N \alpha}{3}.
```


# Notes:

- Permittivity as a function of frequency can take on real or complex values.
- In SI units, permittivity is measured in farads per meter (``F/m`` or ``A^2 s^4 kg^{−1} m^{−3}``). The displacement field ``\mathbf{D}`` is measured in units of coulombs per square meter (``C/m^2``), while the electric field ``\mathbf{E}`` is measured in volts per meter (``V/m``).
- ``\mathbf{D}`` and ``\mathbf{E}`` describe the interaction between charged objects. ``\mathbf{D}`` is related to the charge densities associated with this interaction, while ``\mathbf{E}`` is related to the forces and potential differences.
```math- The permittivity ``\varepsilon`` and permeability ``\mu`` of a medium together determine the phase velocity ``v = \frac{c}{n}`` of electromagnetic radiation through that medium:
\varepsilon \mu = \frac{1}{v^2}.
```
