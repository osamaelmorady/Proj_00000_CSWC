#include <stdio.h>
#include <stdlib.h>

#include <iostream>
#include <cstdlib>

#include "CSWC_int.hpp"

using namespace std;



volatile int x = 0 ;

int main(void)
{


	printf ("hello C Programming!") ;



	std::cin>>x ;
	std::cout<<"hello C++ Programming!";


	std::system("pause");  // Pause program to see the output (Windows)


	while(1) ;

	return 0;
}

