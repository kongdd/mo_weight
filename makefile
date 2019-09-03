FC = gfortran
FCFLAGS = -lgomp -g

OBJS := mo_weight.o mo_profile.o 
# FILEf_mod := $(patsubst %f90, %mod, $(FILEf_src)) 
SRCS := $(patsubst %o, %f90, $(OBJS)) 

target=main.exe

all: prog_wsum.f90 $(OBJS)
	$(FC) $^ $(FCFLAGS) -o $(target)
	./$(target)
# $(FC) -o ben.exe $^ $(FCFLAGS) 
	
$(OBJS): $(SRCS)
	$(FC) $(FCFLAGS) -c $^ #-o $@ 

# gfortran benchmark.f90 -lgomp  -o ben && ./ben
# echo $(FC) $(FCFLAGS) -o $@ $<

.PHONY: clean
clean:  
	@rm -f *.mod *.o *.dll *.so *.exe

# $@    the file name of the target
# $<    the name of the first prerequisite (i.e., dependency)
# $^    the names of all prerequisites (i.e., dependencies)
# $(@D)    the directory part of the target
# $(@F)    the file part of the target
# $(<D)    the directory part of the first prerequisite (i.e., dependency)
# $(<F)    the file part of the first prerequisite (i.e., dependency)
