#include <iostream>
#include <vector>
#include <set>
#include <cstdlib>
#include <ctime>

std::vector<int> fillVector() {
    std::vector<int> vec;
    srand(time(0));

    for (int i = 0; i < 40; ++i) {
        vec.push_back(1 + (rand() % 20));
    }

    return vec;
}

void displayFunction(std::vector<int> vec) {
    std::cout << "Vector contents:\n";
    for (std::vector<int>::iterator it = vec.begin(); it != vec.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;
}

// // Function to fill a set with 1000 random integers between 0 and 20
// void fillAndDisplaySet() {
//     std::set<int> mySet;
//     srand(static_cast<unsigned int>(time(0))); // Initialize random number generator

//     // Fill the set with random numbers
//     for (int i = 0; i < 1000; ++i) {
//         mySet.insert(rand() % 21);
//     }

//     // Display the contents of the set using an iterator
//     std::cout << "Set contents:\n";
//     for (std::set<int>::iterator it = mySet.begin(); it != mySet.end(); ++it) {
//         std::cout << *it << " ";
//     }
//     std::cout << std::endl;

//     // Display the final size of the set
//     std::cout << "Final size of the set: " << mySet.size() << std::endl;
// }

int main() {
    std::vector<int> vec = fillVector();
    displayFunction(vec);

    return 0;
}