#ifndef FUNCTIONS_H_INCLUDED
#define FUNCTIONS_H_INCLUDED

#include <string>

struct WayPoint {
    int set();
};

class UAS {
public:
    int arming(bool armed);
    int set_mode(std::string mode);
    
};

#endif

