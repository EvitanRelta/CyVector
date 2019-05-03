# CyVector
An optimised lightweight module, containing the `Vector` class for **2D vectors**, written in Cython.

## Getting Started
No additional modules required.

Just import the `CyVector.pyd` file.

> **Note:** Changing the `CyVector.pyd` file name will break the module. If you want to change its name, you'll have to recompile it.
## Usage

### Properties
#### `x` and `y`
Returns the x and y values of the 2D vector.
#### `magnitude`
Calculates and returns the magnitude.

> **Note:** The first time `magnitude` is called, the magnitude is calculated, saved in `_magVal` and returned. Subsequent `magnitude` calls will return `_magVal`, unless the `x` or `y` value is changed, whereby the next `magnitude` call will recalcuate, save and return the new magnitude value again.
#### `unitVec`
Constructs and returns the unit vector.
> **Note:** Similar to `magnitude`, first time `unitVec` is called, the unit vector is calculated, saved in `_unitVecVal` and returned; unless `x` or `y` is changed.
#### `copy`
Constructs and returns a new `Vector` with the same values.
### Arithmetic and Algebraic Methods
