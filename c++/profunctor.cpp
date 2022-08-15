#include <stdio.h>
#include <map>
#include <string>

template<class A, class B, class C>
class ProMap : public std::map<A,C> {
private:
    B(*leftFn)(A);
    std::map<B,C> oldMap;
public:
    ProMap(B(*f)(A), std::map<B,C> m): leftFn(f), oldMap(m) {}
    C& operator[](const A& a) {
        return oldMap[leftFn(a)];
    }
};

template<class A, class B, class C>
ProMap<A,B,C> lmap(B(*f)(A), std::map<B,C> m) {
    return ProMap<A,B,C>(f, m);
}

int main() {
    std::map<std::string, int> stringMap { { "width", 640 }, { "height", 480 }, { "frameRate", 25 } };
    std::string(*intToString)(int) = [](int index) -> std::string {
        switch (index) {
            case 0:
                return "width";
            case 1:
                return "height";
            default:
                return "frameRate";
        }
    };
    ProMap<int, std::string, int> intMap(intToString, stringMap);

    printf("intMap[0] = %d, intMap[1] = %d, intMap[2] = %d", intMap[0], intMap[1], intMap[2]);
    return 0;
}
