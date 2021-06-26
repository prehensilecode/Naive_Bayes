### XXX select your compiler
### GNU - Linux and macOS
CXX=g++ -std=c++11
OPT=-O3
CXXFLAGS=-pthread -Wno-deprecated-declarations $(OPT)

### Intel icpc - Linux
#CXX=icpc -std=c++11
#OPT=-O3 -xHost
#CXXFLAGS=-pthread $(OPT)

### If you have Boost installed by your system's package manager (apt, yum, dnf, homebrew)
CPPFLAGS=
LDFLAGS=-lboost_filesystem -lboost_system -lboost_program_options -pthread -lm

### otherwise, manually set the values BOOSTINCLUDEDIR and BOOSTLIBDIR if you have a custom location
#CPPFLAGS=-I$(BOOSTINCLUDEDIR)
#LDFLAGS=-L$(BOOSTLIBDIR) -Wl,-rpath,$(BOOSTLIBDIR) -lboost_filesystem -lboost_system -lboost_program_options -pthread -lm

DBG=-g -O0

OBJS=Genome.o NB.o Diskutil.o main.o

.PHONY: default all clean debug

default: all

all: NB.run

proteus: $(OBJS)
	$(CXX) $(OPT) $(CPPFLAGS) $^ -o $@ $(LDFLAGS)

# NOTE no optimization on debug build
debug: $(OBJS)
	$(CXX) $(DBG) $(CPPFLAGS) $^ -o $@ $(LDFLAGS)

NB.run: $(OBJS)
	$(CXX) $(OPT) $(CPPFLAGS) $^ -o $@ $(LDFLAGS)

clean:
	@rm -f NB.run *.o
