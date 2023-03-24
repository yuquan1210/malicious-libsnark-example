OPTFLAGS = -march=native -mtune=native -O2
CXXFLAGS += -g -Wall -Wextra -Wno-unused-parameter -std=c++11 -fPIC -Wno-unused-variable
CXXFLAGS += -I $(DEPINST)/include -I $(DEPINST)/include/libsnark -DUSE_ASM -DCURVE_ALT_BN128
LDFLAGS += -flto

DEPSRC=depsrc
DEPINST=depinst

LDLIBS += -L $(DEPINST)/lib -Wl,-rpath $(DEPINST)/lib -L . -lsnarkattack -lgmpxx -lgmp
LDLIBS += -lboost_system

all:
	$(CXX) -o test src/test.cpp $(CXXFLAGS) $(LDFLAGS) $(LDLIBS)


clean:
	$(RM) test
