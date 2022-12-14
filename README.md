MD-simulator-and-analyzer
=======
# Overview
LAMMPS is a classical molecular dynamics code with a focus on materials modeling. It's an acronym for Large-scale Atomic/Molecular Massively Parallel Simulator.<br/>
The Weighted Histogram Analysis Method (WHAM) is one of the earliest methods that take into account information from all Intermediate States. By analyzing all the information at once, we can reduce the number of cycles and loops me must run through, improving efficiency. The precursor to WHAM and first version of multiple histogram relighting techniques came from Ferrenberg and Swendsen.<br/>
VMD is a molecular visualization program for displaying, animating, and analyzing large biomolecular systems using 3-D graphics and built-in scripting. VMD supports computers running MacOS X, Unix, or Windows, is distributed free of charge, and includes source code.
# System Requirements
## Software requirements
### OS Requirements
This package is supported for windows, macOS and Linux. The package has been tested on the following systems:<br/>
* Linux: CentOS 8 stream
## Versions the software
LAMMPS 3 Mar 2020
## Installation Guide:
### Install fftw
mkdir software/fftw3<br/>
tar -vxf fftw-3.3.10.tar<br/>
cd fftw-3.3.10<br/>
./configure --prefix=/home/hj/software/fftw3 --enable-shared=yes<br/>
make -j 4<br/>
make install<br/>
### Install mpich
mkdir software/mpich3<br/>
tar -vxf mpich-4.0.1.tar<br/>
cd mpich-4.0.1<br/>
./configure --prefix=/home/hj/software/mpich3 --enable-shared=yes --disable-fortran<br/>
make -j4<br/>
make install<br/>
### Install LAMMPS
cd software<br/>
tar -xvf lammps-stable.tar.gz<br/>
cd lammps-3Mar20/src/MAKE<br/>
vi Makefile.mpi<br/>
##### Modify the section<br/>
CC = g++<br/>
LINK = g++<br/>
MPI_INC = -DMPICH_SKIP_MPICXX -I/home/hj/software/mpich3/include<br/>
MPI_PATH = -L/home/hj/software/mpich3/lib<br/>
MPI_LIB = -lmpich -lmpl -lpthread<br/>
FFT_INC = -DFFT_FFW3 -DFFT_SINGLE -I/home/hj/software/fftw3/include<br/>
FFT_PATH = -L/home/hj/software/fftw3/lib<br/>
FFT_LIB = -lfftw3<br/>
##### Add package
cd lammps-3Mar20/src<br/>
make package-status<br/>
make clean all<br/>
make no-all<br/>
make yes-all<br/>
make no-lib<br/>
make package-status<br/>
make mpi<br/>

### Setting up the development environment:
export PATH=/home/hj/software/fftw3/bin:/home/hj/software/mpich3/bin:$PATH<br/>
export LD_LIBRARY_PATH=/home/hj/software/fftw3/lib:/home/hj/software/mpich3/lib:$LD_LIBRARY_PATH<br/>
export PATH=/home/hj/software/lammps-3Mar20/bin:$PATH<br/>
# Demo
## Test
mpirun -np 2 lmp_mpi < in.shear
### Expected output: 
* log.lammps
# Instructions for use
## Equilibrium
nohup mpirun -np 36 ./lmp_mpi < input_27_0.lammps
## FreeEnergy
### MD simulations
nohup mpirun -np 36 ./lmp_mpi < input.lammps
### Wham
./wham 9 78 150 1e-8 300 0 meta.dat PMF.dat
## Analyse
vmd -e *.tcl
