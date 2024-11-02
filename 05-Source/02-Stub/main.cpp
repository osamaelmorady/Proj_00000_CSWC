#include <stdio.h>
#include <stdlib.h>

#include <iostream>
#include <cstdlib>

#include "CSWC_int.hpp"

// using namespace std;



int C_Var = 0 ;
int CPP_Var = 0 ;

int main(void)
{


	scanf("%d", &C_Var) ;

	for (int i=0;i<C_Var;i++)
	{
		printf ("hello C Programming! %d  \n",C_Var) ;
	}


	std::cin >> CPP_Var ;

	for (int i=0;i<CPP_Var;i++)
	{
		std::cout<<"hello C++ Programming! "<<CPP_Var<< "  "<<std::endl;
	}



	std::system("pause\n");  // Pause program to see the output (Windows)


	// while(1) ;

	return 0;
}

