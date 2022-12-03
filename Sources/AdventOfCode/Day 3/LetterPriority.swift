enum LetterPriority: Int, CaseIterable, Equatable {
case a = 1, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z
    
    init?(rawValue: String) {
        switch rawValue {
        case "a":
            self = .a
        case "b":
            self = .b
        case "c":
            self = .c
        case "d":
            self = .d
        case "e":
            self = .e
        case "f":
            self = .f
        case "g":
            self = .g
        case "h":
            self = .h
        case "i":
            self = .i
        case "j":
            self = .j
        case "k":
            self = .k
        case "l":
            self = .l
        case "m":
            self = .m
        case "n":
            self = .n
        case "o":
            self = .o
        case "p":
            self = .p
        case "q":
            self = .q
        case "r":
            self = .r
        case "s":
            self = .s
        case "t":
            self = .t
        case "u":
            self = .u
        case "v":
            self = .v
        case "w":
            self = .w
        case "x":
            self = .x
        case "y":
            self = .y
        case "z":
            self = .z
        case "A":
            self = .A
        case "B":
            self = .B
        case "C":
            self = .C
        case "D":
            self = .D
        case "E":
            self = .E
        case "F":
            self = .F
        case "G":
            self = .G
        case "H":
            self = .H
        case "I":
            self = .I
        case "J":
            self = .J
        case "K":
            self = .K
        case "L":
            self = .L
        case "M":
            self = .M
        case "N":
            self = .N
        case "O":
            self = .O
        case "P":
            self = .P
        case "Q":
            self = .Q
        case "R":
            self = .R
        case "S":
            self = .S
        case "T":
            self = .T
        case "U":
            self = .U
        case "V":
            self = .V
        case "W":
            self = .W
        case "X":
            self = .X
        case "Y":
            self = .Y
        case "Z":
            self = .Z
        default:
            preconditionFailure()
        }
    }
}


struct Alphabet {
    static let lowercase = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    static let uppercase = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    static let allLetters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
}

enum AllLetters: String, CaseIterable {
    case a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z
}
