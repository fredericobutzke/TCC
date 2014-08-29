#include <systemc.h>
#include <stdio.h>
#include <iostream>
#include <sstream>
#include <string>
#include <fstream>

SC_MODULE (nand2) {

	sc_in < bool > A;
	sc_in < bool > B;
	sc_out < bool > Z;

	int delay;
	
	SC_CTOR(nand2) : A("A") , B("B") , Z("Z") {
		SC_METHOD(behavioral);
		sensitive << A;
		sensitive << B;
	}
    void behavioral();
};
