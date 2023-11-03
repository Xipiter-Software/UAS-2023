#ifndef FUNCTIONS_H_INCLUDED
#define FUNCTIONS_H_INCLUDED

#include <string>



class UAS {
public:
    class WP {
        public:
            int set();
    };
    int arming(bool armed);
    int set_mode(std::string mode);
    
};


#endif

