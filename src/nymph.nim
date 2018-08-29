# nymph
# salsa20 and poly1305 implementations in pure nim

type Salsa20State = array[16, uint32]

proc cshl(x: uint32, y: SomeInteger): uint32 =
    (x shl y) xor (x shr (32 - y))

## implements the Salsa20 quarter-round core
proc quarterRound*(a, b, c, d: var uint32) {.inline.} =
    b = b xor ((a + d).cshl 7)
    c = c xor ((b + a).cshl 9)
    d = d xor ((c + b).cshl 13)
    a = a xor ((d + c).cshl 18)

## implements the Salsa20 row round
proc rowRound*(x: var Salsa20State) =
    quarterRound(x[ 0], x[ 1], x[ 2], x[ 3])
    quarterRound(x[ 5], x[ 6], x[ 7], x[ 4])
    quarterRound(x[10], x[11], x[ 8], x[ 9])
    quarterRound(x[15], x[12], x[13], x[14])

## implements the Salsa20 column round
proc columnRound*(x: var Salsa20State) =
    quarterRound(x[ 0], x[ 4], x[ 8], x[12])
    quarterRound(x[ 5], x[ 9], x[13], x[ 1])
    quarterRound(x[10], x[14], x[ 2], x[ 6])
    quarterRound(x[15], x[ 3], x[ 7], x[11])

## implements the Salsa20(x) hash function, where x is a 64-byte sequence
proc salsaHash*(x: Salsa20State): Salsa20State =
    var y: Salsa20State = x;
    
    # ten double-rounds
    for i in 1..10:
        columnRound(y)
        rowRound(y)
    
    for i in 0..<16:
        y[i] += x[i]
    
    return y