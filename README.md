# elliptic-curve-solidity 

`elliptic-curve-solidity` is an open source implementation of Elliptic Curve arithmetic operations written in Solidity.


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

The `elliptic-curve-solidity` contract supports up to 256-bit curves. However, it has been extensively tested for the following curves:

- `secp256k1`
- `secp224k1`
- `secp192k1`
- `secp256r1` (aka P256)
- `secp192r1` (aka P192)
- `secp224r1` (aka P224)


## Acknowledgements

Some functions of the contract are based on:

- [elliptic-curve-solidity](https://github.com/witnet/elliptic-curve-solidity/blob/master/README.md) by witnet
- [Comparatively Study of ECC and Jacobian Elliptic Curve Cryptography](https://pdfs.semanticscholar.org/5c64/29952e08025a9649c2b0ba32518e9a7fb5c2.pdf) by Anagha P. Zele and Avinash P. Wadhe
- [`Numerology`](https://github.com/nucypher/numerology) by NuCypher
- [`solidity-arithmetic`](https://github.com/gnosis/solidity-arithmetic) by Gnosis
- [`ecsol`](https://github.com/jbaylina/ecsol) written by Jordi Baylina
- [`standard contracts`](https://github.com/androlo/standard-contracts) written by Andreas Olofsson

## License

`elliptic-curve-Noir` is published under the [MIT license][license].
