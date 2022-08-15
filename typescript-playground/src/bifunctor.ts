type Pair<A, B> = {
    a: A,
    b: B,
}

const bimap = <A1, B1>(f: (a1: A1) => B1) => <A2, B2>(g: (b1: A2) => B2) => (p: Pair<A1, A2>): Pair<B1, B2> => {
    return {
        a: f(p.a),
        b: g(p.b),
    }
}
