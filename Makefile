### XXX select your compiler
### GNU - Linux and macOS
CXX=g++ -std=c++11

# XXX OPTIMIZED production build
#OPT=-O3 -march=native

# XXX DEBUG
# OPT=-g
#
# XXX QUESTION should a profiling build be optimized?
# XXX PROFILE
OPT=-g -O3 -pg
CXXFLAGS=-pthread -Wno-deprecated-declarations $(OPT)

### Intel icpc - Linux
#CXX=icpc -std=c++11
#OPT=-O3 -xHost
#CXXFLAGS=-pthread $(OPT)

### If you have Boost installed by your system's package manager (apt, yum, dnf, homebrew)
#CPPFLAGS=
#LDFLAGS=-lboost_filesystem -lboost_system -lboost_program_options -pthread -lm

### otherwise, manually set the values BOOSTINCLUDEDIR and BOOSTLIBDIR if you have a custom location
CPPFLAGS=-I$(BOOSTINCLUDEDIR)
LDFLAGS=-L$(BOOSTLIBDIR) -Wl,-rpath,$(BOOSTLIBDIR) -lboost_filesystem -lboost_system -lboost_program_options -pthread -lm

PROG=NB.run
OBJS=Genome.o NB.o Diskutil.o main.o

.PHONY: default all clean debug

default: all

all: $(PROG)

proteus: $(OBJS)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $^ -o $(PROG) $(LDFLAGS)

# NOTE no optimization on debug build
debug: $(OBJS)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $^ -o $(PROG) $(LDFLAGS)

profile: $(OBJS)
	$(CXX) $(CPPFLAGS) $^ -o $(PROG) $(LDFLAGS)

$(PROG): $(OBJS)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $^ -o $@ $(LDFLAGS)

clean:
	@rm -f NB.run *.o
