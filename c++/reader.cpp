#include <ctime>
#include <iostream>
#include <functional>

template<class R, class A>
using reader = std::function<A(R)>;

template<class R, class A, class B>
reader<R, B> fmap(std::function<B(A)> f, reader<R, A> g) {
    return [&f, &g] (R r) -> B {
        return f ( g ( r) );
    };
}

std::tm get_current_date() {
    time_t now;
    time(&now);
    std::tm* current_date = std::localtime(&now);

    return *current_date;
}

// Make a tm structure representing this date
std::tm make_tm(int year, int month, int day)
{
    std::tm tm = {0};
    tm.tm_year = year - 1900; // years count from 1900
    tm.tm_mon = month - 1;    // months count from January=0
    tm.tm_mday = day;         // days count from 1
    return tm;
}

unsigned calc_age_in_seconds(unsigned year, unsigned month, unsigned day) {
    std::tm birth_date = make_tm(year, month, day);
    std::tm current_date = get_current_date();
 
    std::time_t difference_in_seconds = std::difftime(std::mktime(&current_date), std::mktime(&birth_date));

    return difference_in_seconds; 
}

using birth_year = unsigned;

birth_year calc_birth_year(unsigned age_in_seconds) {
    std::tm current_date = get_current_date();
    std::time_t current_date_in_seconds = std::mktime(&current_date);
    std::time_t birth_date_in_seconds = std::difftime(current_date_in_seconds, age_in_seconds);

    return std::localtime(&birth_date_in_seconds)->tm_year + 1900;
}

int main()
{
    reader<std::string, unsigned> age_in_seconds_reader = [] (std::string name) -> unsigned {
        if (name == "Lukas") { return calc_age_in_seconds(1994, 06, 30); }
        else if (name == "Alyona") { return calc_age_in_seconds(1995, 01, 14); }
        else { return 0u; }
    };

    std::cout << "Get Ages" << std::endl;
    std::cout << "Lukas is " << age_in_seconds_reader("Lukas") << " second old." << std::endl;
    std::cout << "Alyona is " << age_in_seconds_reader("Alyona") << " seconds old." << std::endl;

    reader<std::string, birth_year> birth_year_reader = fmap<std::string, unsigned, birth_year>(calc_birth_year, age_in_seconds_reader);

    std::cout << "Get Birthdays" << std::endl;
    std::cout << "Lukas has been born in " << birth_year_reader("Lukas") << std::endl;
    std::cout << "Alyona has been born in " << birth_year_reader("Alyona") << std::endl;

    return 0;
}

