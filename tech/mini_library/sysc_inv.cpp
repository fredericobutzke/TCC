#include "sysc_inv.h"


#ifdef MTI_SYSTEMC
// export top level to modelsim
SC_MODULE_EXPORT(inv);
#elif defined(NC_SYSTEMC)
// export top level to Cadence Incisive
NCSC_MODULE_EXPORT(inv);
#endif

void inv::behavioral() {
	bool local_A;
	delay=rand()/100;
	local_A=A.read();
	next_trigger(delay, SC_PS);
	if(local_A==0) Z.write(1);
	else Z.write(0);
}
