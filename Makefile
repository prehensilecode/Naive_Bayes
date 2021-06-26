### XXX select your compiler
### GNU
#CXX=g++ -std=c++11
#OPT=-O3
#CXXFLAGS=-pthread -Wno-deprecated-declarations $(OPT)

### Intel icpc
CXX=icpc -std=c++11
OPT=-O3 -xHost
CXXFLAGS=-pthread $(OPT)

### If you have Boost installed by your system's package manager (apt, yum ,dnf)
#CPPFLAGS=
#LDFLAGS=-lboost_filesystem -lboost_system -lboost_program_options -pthread -lm

### otherwise, manually set the values BOOSTINCLUDEDIR and BOOSTLIBDIR if you have a custom location
CPPFLAGS=-I$(BOOSTINCLUDEDIR)
LDFLAGS=-L$(BOOSTLIBDIR) -lboost_filesystem -lboost_system -lboost_program_options -pthread -lm

DBG=-g

OBJS=Genome.o NB.o Diskutil.o main.o

.PHONY: default all clean debug

default: all

all: NB.run

proteus: $(OBJS)
	$(CXX) $(OPT) $(CPPFLAGS) $^ -o $@ $(LDFLAGS)

debug: $(OBJS)
	$(CXX) $(OPT) $(DBG) $(CPPFLAGS) $^ -o $@ $(LDFLAGS)

NB.run: $(OBJS)
	$(CXX) $(OPT) $(CPPFLAGS) $^ -o $@ $(LDFLAGS)

clean:
	@rm -f NB.run *.o
