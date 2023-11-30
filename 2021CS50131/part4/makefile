pre-build: 
	mkdir -p obj
	mkdir -p exe

all: pre-build
	cd src1 && $(MAKE)
	cd src2 && $(MAKE)      
	$(MAKE) myApp
	
myApp: main.c obj/add.o obj/square.o
	cc main.c obj/add.o obj/square.o -o myApp;mv myApp exe	

run:
	./exe/myApp


clean:
	$(MAKE) -C src1 clean
	$(MAKE) -C src2 clean
	rm -r exe obj
        
