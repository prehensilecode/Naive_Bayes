CXX=g++ -std=c++11 -pthread
OPT=-O3
CPPFLAGS=-I$(BOOSTINCLUDEDIR)
LDFLAGS=-L$(BOOSTLIBDIR) -lboost_filesystem -lboost_system -lboost_program_options
DBG=-g

SRCS=Class.cpp Class.hpp NB.cpp NB.hpp main.cpp Genome.hpp Genome.cpp Diskutil.hpp Diskutil.cpp
CXXSRCS=Genome.cpp NB.cpp Diskutil.cpp main.cpp

.PHONY: default all clean debug

default: all

all: NB.run

proteus: $(CXXSRCS)
	$(CXX) $(OPT) $(CPPFLAGS) $^ -o $@ $(LDFLAGS)

debug: $(CXXSRCS)
	$(CXX) $(OPT) $(DBG) $(CPPFLAGS) $^ -o $@ $(LDFLAGS)

NB.run: $(CXXSRCS)
	$(CXX) $(OPT) $(CPPFLAGS) $^ -o $@ $(LDFLAGS)

clean:
	@rm -f NB.run
