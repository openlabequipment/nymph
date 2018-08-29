import nymph

# --- QUARTERROUND VECTORS --- #
block:
    # QUARTERROUND: VECTOR #1
    var s = [0x00000000'u32, 0x00000000'u32, 0x00000000'u32, 0x00000000'u32]
    quarterRound(s[0], s[1], s[2], s[3])
    doAssert(s == [0'u32, 0'u32, 0'u32, 0'u32])

    # QUARTERROUND: VECTOR #2
    s = [0x00000001'u32, 0x00000000'u32, 0x00000000'u32, 0x00000000'u32]
    quarterRound(s[0], s[1], s[2], s[3])
    doAssert(s == [0x08008145'u32, 0x00000080'u32, 0x00010200'u32, 0x20500000'u32])

    # QUARTERROUND: VECTOR #3
    s = [0x00000000'u32, 0x00000001'u32, 0x00000000'u32, 0x00000000'u32]
    quarterRound(s[0], s[1], s[2], s[3])
    doAssert(s == [0x88000100'u32, 0x00000001'u32, 0x00000200'u32, 0x00402000'u32])

    # QUARTERROUND: VECTOR #4
    s = [0x00000000'u32, 0x00000000'u32, 0x00000001'u32, 0x00000000'u32]
    quarterRound(s[0], s[1], s[2], s[3])
    doAssert(s == [0x80040000'u32, 0x00000000'u32, 0x00000001'u32, 0x00002000'u32])

    # QUARTERROUND: VECTOR #5
    s = [0x00000000'u32, 0x00000000'u32, 0x00000000'u32, 0x00000001'u32]
    quarterRound(s[0], s[1], s[2], s[3])
    doAssert(s == [0x00048044'u32, 0x00000080'u32, 0x00010000'u32, 0x20100001'u32])

    # QUARTERROUND: VECTOR #6
    s = [0xe7e8c006'u32, 0xc4f9417d'u32, 0x6479b4b2'u32, 0x68c67137'u32]
    quarterRound(s[0], s[1], s[2], s[3])
    doAssert(s == [0xe876d72b'u32, 0x9361dfd5'u32, 0xf1460244'u32, 0x948541a3'u32])

    # QUARTERROUND: VECTOR #7
    s = [0xd3917c5b'u32, 0x55f1c407'u32, 0x52a58a7a'u32, 0x8f887a3b'u32]
    quarterRound(s[0], s[1], s[2], s[3])
    doAssert(s == [0x3e2f308c'u32, 0xd90a8f36'u32, 0x6ab2a923'u32, 0x2883524c'u32])

# --- ROWROUND VECTORS --- #
block:
    # ROWROUND: VECTOR #1
    var s = [0x00000001'u32, 0x00000000'u32, 0x00000000'u32, 0x00000000'u32,
             0x00000001'u32, 0x00000000'u32, 0x00000000'u32, 0x00000000'u32,
             0x00000001'u32, 0x00000000'u32, 0x00000000'u32, 0x00000000'u32,
             0x00000001'u32, 0x00000000'u32, 0x00000000'u32, 0x00000000'u32]
    rowRound(s)
    doAssert(s == [0x08008145'u32, 0x00000080'u32, 0x00010200'u32, 0x20500000'u32,
                   0x20100001'u32, 0x00048044'u32, 0x00000080'u32, 0x00010000'u32,
                   0x00000001'u32, 0x00002000'u32, 0x80040000'u32, 0x00000000'u32,
                   0x00000001'u32, 0x00000200'u32, 0x00402000'u32, 0x88000100'u32])
    
    # ROWROUND: VECTOR #2
    s = [0x08521bd6'u32, 0x1fe88837'u32, 0xbb2aa576'u32, 0x3aa26365'u32,
         0xc54c6a5b'u32, 0x2fc74c2f'u32, 0x6dd39cc3'u32, 0xda0a64f6'u32,
         0x90a2f23d'u32, 0x067f95a6'u32, 0x06b35f61'u32, 0x41e4732e'u32,
         0xe859c100'u32, 0xea4d84b7'u32, 0x0f619bff'u32, 0xbc6e965a'u32]
    rowRound(s)
    doAssert(s == [0xa890d39d'u32, 0x65d71596'u32, 0xe9487daa'u32, 0xc8ca6a86'u32,
                   0x949d2192'u32, 0x764b7754'u32, 0xe408d9b9'u32, 0x7a41b4d1'u32,
                   0x3402e183'u32, 0x3c3af432'u32, 0x50669f96'u32, 0xd89ef0a8'u32,
                   0x0040ede5'u32, 0xb545fbce'u32, 0xd257ed4f'u32, 0x1818882d'u32])


# let hashVecZeros = [0'u32, 0'u32, 0'u32, 0'u32, 0'u32, 0'u32, 0'u32, 0'u32, 0'u32, 0'u32, 0'u32, 0'u32, 0'u32, 0'u32, 0'u32, 0'u32]
# doAssert(salsaHash(hashVecZeros) == hashVecZeros)

# let hashVec1 = [1930272723'u32, 3075618636'u32, 635335939'u32, 2297084863'u32, 817098033'u32, 3685902849'u32, 816236463'u32, 3484618838'u32, 1059123231'u32, 2707247887'u32, 1899008884'u32, 617363438'u32, 1340852559'u32, 798773507'u32, 4092861131'u32, 912815704'u32]
# let hashVec1Output = [2830248557'u32, 4009291932'u32, 3418277032'u32, 2594860570'u32, 446045469'u32, 4192935574'u32, 821797822'u32, 959680581'u32, 2643994742'u32, 1578842548'u32, 602679915'u32, 1920102171'u32, 2280189147'u32, 309238639'u32, 2657085464'u32, 3392148403'u32]
# echo(salsaHash(hashVec1))
