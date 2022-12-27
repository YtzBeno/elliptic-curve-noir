# elliptic-curve-noir 

`elliptic-curve-noir` is an open source implementation of Elliptic Curve arithmetic operations written in noir.


It contains 1 Noir library

1. `EllipticCurve.nr`: provides main elliptic curve operations in affine and Jacobian coordinates.


This library provides functions for:

- Modular
  - inverse
  - exponentiation
- Jacobian coordinates
  - addition
  - double
  - multiplication
- Affine coordinates
  - inverse
  - addition
  - subtraction
  - multiplication
- Auxiliary
  - conversion to affine coordinates
  - derive coordinate Y from compressed EC point
  - check if EC point is on curve

## Supported curves

The `elliptic-curve-noir` contract has been extensively tested for the following curves:

- `secp256k1`
- `secp224k1`
- `secp192k1`
- `secp256r1` (aka P256)
- `secp192r1` (aka P192)
- `secp224r1` (aka P224)


## Acknowledgements

Credits must go to witnet. I used his repo as source.

- [elliptic-curve-solidity](https://github.com/witnet/elliptic-curve-solidity/blob/master/README.md) by witnet
