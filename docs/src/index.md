# Permittivity


# Material models

## Dielectrics Materials

Dielectrics and Conductors: This includes perfect (lossless) dielectrics, conductive (lossy) materials, and perfect electric conductors.
- Dielectric constant

## Dispersive Materials

Dispersive (frequency-dependent) materials can correctly describe the physics behind the optical responses.
- Dielectric constant of free electron gas
- Drude model: describes intraband electron motion.
- Lorentz oscillator model: describes interband electron transitions.
- Debye model: describes the relaxation of atomic vibrations.
- Cole–Cole model
- Cole-Davidson
- Havriliak-Negami

## Arbitrarily-accurate Models

The arbitrarily-accurate (albeit, perhaps unphysical) fits to experimental optical data can be obtained.

- multi-pole Debye model with static conductivity
- Drude model in combination with multiple Lorentz oscillator poles
- Interpolation of tabulated data

## Nonlocal Materials

Spatially-nonlocal effects arise when electrons are confined to small regions of space. Examples include junctions between structures, the areas around the edges of small structures, etc. These can significantly modify the electromagnetic fields, relative to classical (local) effects.


### Examples
```julia-repl
julia> using Permittivity

```

## Index

```@index
```


