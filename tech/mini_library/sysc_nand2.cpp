#include "sysc_nand2.h"


#ifdef MTI_SYSTEMC
// export top level to modelsim
SC_MODULE_EXPORT(nand2);
#elif defined(NC_SYSTEMC)
// export top level to Cadence Incisive
NCSC_MODULE_EXPORT(nand2);
#endif

void nand2::behavioral() {
	bool local_A, local_B;
	delay=rand()/100;
	local_A=A.read();
	local_B=B.read();
	next_trigger(delay, SC_PS);
	if(local_B==1 && local_A==1) Z.write(1);
	else Z.write(0);
}
