# CyVector
An optimised lightweight module, containing the `Vector` class for **2D vectors**, written in Cython.

## Getting Started
No additional modules required.

Just import the `CyVector.pyd` file.

> **Note:** Changing the `CyVector.pyd` file name will break the module. If you want to change its name, you'll have to recompile it.

## Properties
#### `x` and `y`
Returns the x and y values of the 2D vector.
#### `magnitude`
Calculates and returns the magnitude.

> **Note:** The first time `magnitude` is called, the magnitude is calculated, saved in `_magVal` and returned. Subsequent `magnitude` calls will return `_magVal`, unless the `x` or `y` value is changed, whereby the next `magnitude` call will recalcuate, save and return the new magnitude value again.
#### `unitVec`
Constructs and returns the unit vector.
> **Note:** Similar to `magnitude`, first time `unitVec` is called, the unit vector is calculated, saved in `_unitVecVal` and returned; unless `x` or `y` is changed.
#### `copy`
Constructs and returns a new `Vector` with the `x`, `y` values, and `_magVal` and `_unitVecVal` values _(if they've been calculated)_.

<br>

## 

<br>

## Arithmetic Operators and Methods
Let `vec` and `other` be `Vector` instances,
and `k` be a `int` or `float`:
#### `- vec`
```
return Vector(- vec._x, - vec._y)
```
#### `+ vec`
```
return vec.copy
```
#### `vec + other`, `vec += other` and `vec.add(other)`
Vector addition.
#### `vec - other`, `vec -= other` and `vec.subtract(other)`
Vector subtraction.
#### `vec / k`, `vec /= k` and `vec.scalarDiv(k)`
Scalar division.
#### `vec * other` and `vec.dot(other)`
Returns the dot product.
> **Note:** `vec *= other` raises `TypeError`
#### `vec * k`, `k * vec` and `vec.scalarMul(k)`
Scalar multiplication.

<br>

## Misc.
Let `vec` and `other` be `Vector` instances:
### Indexer
- `vec[0]` gets and sets `vec.x`
- `vec[1]` gets and sets `vec.y`
- `vec[i]`, where i > 1; raises `IndexError`
### Length
`len(vec)` will always return `2`.
#### `vec.setValue(newX, newY)`
Sets `vec.x` and `vec.y` to `newX` and `newY`.
#### `__eq__` and `__ne__`
`vec == other` returns `True` if `vec.x == other.x` and `vec.y == other.y`
#### `__str__`
Returns `"<{x}, {y}>"`, where `{x}` and `{y}` are the instance's x and y values.
#### `__repr__`
Returns:
```
<{x}, {y}>
Magnitude: {magnitude}
Unit Vector: {unitVector}
```
where `{x}` and `{y}` are the instance's x and y values;<br>
if the magnitude has been calculated prior, `{magnitude}` is the magnitude value, else `<Not yet calculated>` is displayed;<br>
similarly, `{unitVector}` is the unit vector or `<Not yet calculated>`.

<br>

Null vectors _(ie. vector: <0, 0>)_ will return the string:
```
<0, 0>
Magnitude: 0
Unit Vector: <Undefined>
```

<br>

***
## Todo
- [ ] `- vec` should return `Vector` `output`, with `output._magVal = vec._magVal` and `output._unitVecVal = new Vector(-vec._unitVecVal.x, -vec._unitVecVal.y)`
- [ ] Add `.toNumpyArray()`
- [ ] Add `list(vec)` and `tuple(vec)`
- [ ] Create optimised list of `Vectors`
