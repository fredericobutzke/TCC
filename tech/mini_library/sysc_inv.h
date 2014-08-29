#include <systemc.h>
#include <stdio.h>
#include <iostream>
#include <sstream>
#include <string>
#include <fstream>

SC_MODULE (inv) {

	sc_in < bool > A;
	sc_out < bool > Z;

	int delay;
	
	SC_CTOR(inv) : A("A") , Z("Z") {
		SC_METHOD(behavioral);
		sensitive << A;
	}
    void behavioral();
};
