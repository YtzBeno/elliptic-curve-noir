let mut U255_MAX_PLUS_1: comptime Field = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

fn invMod(_x : pub Field, _pp : pub Field) -> Field {
    constrain _x != 0;
    constrain _x != _pp;
    constrain _pp != 0;

    let mut q = 0;
    let mut newT = 1;
    let mut r = _pp;
    let mut t;

    for _x in != 0 {
        let t = r / _x;
        (q, newT) = (newT, addmod(q, (_pp - mulmod(t, newT, _pp)), _pp));
        (r, _x) = (_x, r - t * _x);
    };

    q

}

fn toAffine(_x : pub Field, _y : pub Field, _z : pub Field, _pp : pub Field) -> (Field, Field) {
    let zInv = invMod(_z, _pp);
    let zInv2 = mulmod(zInv, zInv, _pp);
    let x2 = mulmod(_x, zInv2, _pp);
    let y2 = mulmod(_y, mulmod(zInv, zInv2, _pp), _pp);

    (x2, y2)
}

fn isOnCurve(_x : pub Field, _y : pub Field, _aa : pub Field, _bb : pub Field, _pp : pub Field) -> bool {
    if (_x == 0) | (_x >= 0 _pp) | (_y == 0) | (_y >= _pp) {
        let a = false;
        a
    }

    let lhs  mulmod(_y, _y, _pp);
    let mut rhs = mulmod(mulmod(_x, _x, _pp), _x, _pp);

    if _aa != 0 {
        let mut rhs = addmod(rhs, mulmod(_x, _aa, _pp), _pp);
    }

    if _bb != 0 {
        let mut rhs = addmod(rhs, _bb, _pp);
    }

    if lhs == rhs {
        true
    } else {
        false
    }

}

fn ecInv(_x : pub Field, _y : pub Field, _pp : pub Field) -> (Field, Field) {
    (_x, (_pp - _y) % _pp)
}

fn ecAdd(_x1 : pub Field, _y1 : pub Field, _x2 : pub Field, _y2 : pub Field, _aa : pub Field, _pp : pub Field) -> (Field, Field) {
    let x = 0;
    let y = 0;
    let z = 0;

    if _x1 == _x2 {
        if addmod(_y1, _y2, _pp) == 0 {
            (0,0)
        } else {
            (x, y, z) = jacDouble(_x1, _y1, 1, _aa, _pp);
        }

    } else {
        (x, y, z) = jacAdd(_x1, _y1, 1, _x2, _y2, 1, _pp);
    }

    let b = toAffine(x, y, z, _pp);
    b
}

fn ecSub(_x1 : pub Field, _y1 : pub Field, _x2 : pub Field, _y2 : pub Field, _aa : pub Field, _pp : pub Field) -> (Field, Field) {
    let x;
    let y;

    (x, y) = ecInv(_x2, _y2, _pp);

    let b = ecAdd(_x1, _y1, x, y, _aa, _pp);
    b
}

fn ecMul(k : pub Field, _x : pub Field, _y : pub Field, _aa : pub Field, _pp : pub Field) -> (Field, Field) {
    let x1;
    let y1;
    let z1;

    (x1, y1, z1) = jacMul(_k, _x, _y, 1, _aa, _pp);

    let b = toAffine(x1, y1, z1, _pp);
    b
}

fn jacAdd(_x1 : pub Field, _y1 : pub Field, _z1 : pub Field, _x2 : pub Field, _y2 : pub Field, _z2 : pub Field, _pp : pub Field) -> (Field, Field, Field) {
    if (x_1 == 0) & (_y1 == 0) {
        (_x2, _y2, _z2)
    }

    if (_x2 == 0) & (_y2 == 0) {
        (_x1, _y1, _z1)
    }

    let mut My_Array = [Field; 4];
    let mut My_Array[0] = mulmod(_z1, _z1, _pp);
    let mut My_Array[1] = mulmod(_z1, zs[0], _pp);
    let mut My_Array[2] = mulmod(_z2, _z2, _pp);
    let mut My_Array[3] = mulmod(_z2, zs[2], _pp);

    let My_Array [
        mulmod(_x1, My_Array[2], _pp),
        mulmod(_y1, My_Array[3], _pp),
        mulmod(_x2, My_Array[0], _pp),
        mulmod(_y2, My_Array[1], _pp),
    ];

    constrain  My_Array[0] != My_Array[2] | constrain My_Array[1] != My_Array[3]

    let hr = [Field; 4];
    let hr[0] = addmod(My_Array[2], _pp - My_Array[0], _pp);
    let hr[1] = addmod(My_Array[3], _pp - My_Array[1], _pp);
    let hr[2] = mulmod(hr[0], hr[0], _pp);
    let hr[3] = mulmod(hr[2], hr[0], _pp);

    let mut qx = addmod(mulmod(hr[1], hr[1], _pp), _pp - hr[3], _pp);
    let qx = addmod(qx, _pp - mulmod(2, mulmod(zs[0], hr[2], _pp), _pp), _pp);

    let qy = mulmod(hr[1], addmod(mulmod(zs[0], hr[2], _pp), _pp - qx, _pp), _pp)

    let qz = mulmod(hr[0], mulmod(_z1, _z2, _pp), _pp);

    (qx, qy, qz)

}

fn jacDouble(_x : pub Field, _y : pub Field, _z : pub Field, _aa : pub Field, _pp : pub Field) -> (Field, Field, Field) {
    if _z == 0 {
        (_x, _y, _z)
    }

    let mut x = mulmod(_x, _x, _pp);
    let mut y = mulmod(_y, _y, _pp);
    let mut z = mulmod(_z, _z, _pp);

    let mut s = mulmod(4, mulmod(_x, y, _pp), _pp);

    let mut m = addmod(mulmod(3, x, _pp), mulmod(_aa, mulmod(z, z, _pp), _pp), _pp);

    let x = addmod(mulmod(m, m, _pp), _pp - addmod(s, s, _pp), _pp);
    let y = addmod(mulmod(m, addmod(s, _pp - x, _pp), _pp), _pp - mulmod(8, mulmod(y, y, _pp), _pp), _pp);
    let z = mulmod(2, mulmod(_y, _z, _pp), _pp);

    (x, y, z);
    
}

fn jacMul(_d : pub Field, _x : pub Field, _y : pub Field, _z : pub Field, _aa : pub Field, _pp : pub Field) -> (Field, Field, Field) {
    if _d == 0 {
        (_x, _y, _z);
    }

    let mut remaining = _d;
    let mut qx = 0;
    let mut qy = 0;
    let mut qz = 1;

    for remaining in != 0 {
        if (remaining & 1) != 0 {
            (qx, qy, qz) = jacAdd(qx, qy, qz, _x, _y, _z, _pp);
        }
        remaining = remaining / 2;
        (_x, _y, _z) = jacDouble(_x, _y, _z, _aa, _pp);
    };

    (qx, qy, qz);
}
