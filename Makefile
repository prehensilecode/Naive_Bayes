CXX=g++ -std=c++11 -pthread
OPT=-O3
CPPFLAGS=-I$(BOOSTINCLUDEDIR)
LDFLAGS=-L$(BOOSTLIBDIR) -lboost_filesystem -lboost_system -lboost_program_options
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
