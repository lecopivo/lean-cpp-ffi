#include <stdio.h>
#include <iostream>

// this works
// extern "C" size_t print_int(size_t n){
//     printf("from c++, n = %d\n", n);
//     return n;
// }


extern "C" size_t print_int(size_t n){
    std::cout << "from c++, n =" << n << std::endl;
    return n;
}

