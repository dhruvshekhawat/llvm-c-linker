TARGET=grid
FLAGS= -use-ocamlfind -pkgs llvm,llvm.analysis,llvm.bitwriter,llvm.bitreader,llvm.linker,llvm.target -cflags -w,+a-4
OCAMLBUILD=ocamlbuild
OPAM=opam config env


.PHONY: master.all native

all: clib native
	@ echo "Finished!"

clib:
	@ echo "## Building Extern C Lib"
	@ clang-3.8 -c -emit-llvm c_lib.c -lm

native:
	@ echo "## Building Grid.native"
	@ $(OCAMLBUILD) $(FLAGS) $(TARGET).native



# "make clean" removes all generated files
.PHONY : clean

clean :
	ocamlbuild -clean
	rm -rf test_DNAs.log *.diff DNAs scanner.ml parser.ml parser.mli
	rm -rf *.cmx *.cmi *.cmo *.cmx *.o *.ll
