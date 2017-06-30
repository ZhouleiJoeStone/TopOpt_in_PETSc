#在virtual Box-dealVM下用Qt Creator建立topopt工程
#编译若出现/usr/bin/ld: cannot find lGL,则进行如下操作：
#在终端查找libGL: locate libGL 定位在 /usr/lib/x86_64-linux-gnu/mesa/libGL.so.1 
#在usr/lib中添加对libGL.so.1的链接：sudo ln -s /usr/lib/libGL.so.1 /usr/lib/libGL.so
#如此即可编译通过
TARGET     = topopt
APP_DIR    = /home/ubuntu/Code/TopOpt_in_PETSc-master
PETSC_DIR  = /home/ubuntu/Code/petsc/
PETSC_ARCH = arch-linux2-c-debug
PETSC_BINS = $$PETSC_DIR/bin

INCLUDEPATH +=  $$APP_DIR  \
                $$PETSC_DIR/include\
                $$PETSC_DIR/$$PETSC_ARCH/include \

LIBS += -L$$PETSC_DIR/$$PETSC_ARCH/lib \


LIBS += -lm -lpetsc -lstdc++ -lmpicxx -lmpi -llapack -lblas -lgfortran -ldl -lrt -lgcc_s



QMAKE_CC  = gcc
QMAKE_CXX = g++

QMAKE_CFLAGS   += -fPIC -g3 −O0
QMAKE_CXXFLAGS += -g -fPIC -O0
#QMAKE_LFLAGS   += −O3

HEADERS += \
          $$APP_DIR/Filter.h \
          $$APP_DIR/LinearElasticity.h \
          $$APP_DIR/MMA.h \
          $$APP_DIR/MPIIO.h \
          $$APP_DIR/PDEFilter.h \
          $$APP_DIR/TopOpt.h


SOURCES += \
          $$APP_DIR/Filter.cc \
          $$APP_DIR/LinearElasticity.cc \
          $$APP_DIR/MMA.cc \
          $$APP_DIR/MPIIO.cc \
          $$APP_DIR/PDEFilter.cc \
          $$APP_DIR/TopOpt.cc \
          $$APP_DIR/main.cc
