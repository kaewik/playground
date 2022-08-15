#include <stdio.h>

template<class A, class B>
class Pair {
public:
    A a;
    B b;
};

template<class A1, class A2, class B1, class B2>
Pair<B1, B2> bimap(B1 (*f)(A1), B2 (*g)(A2), Pair<A1, A2> p) {
    return { f(p.a), g(p.a) };
}

int main() {
    Pair<int, int> p = {1, 1};
    auto plus1 = [](int a){ return a+1;};
    auto plus2 = [](int a){ return a+2;};
    auto res = bimap<int, int, int, int>(plus1, plus2, p);

    printf("Result is (%d, %d)", res.a, res.b);
    return 0;
}
