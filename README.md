# MD-simulator-and-analyzer
# Overview
LAMMPS is a classical molecular dynamics code with a focus on materials modeling. It's an acronym for Large-scale Atomic/Molecular Massively Parallel Simulator.
# System Requirements
# Software requirements
This package is supported for windows, macOS and Linux. The package has been tested on the following systems:
Linux: CentOS 8 stream
# Versions the software
LAMMPS 3 Mar 2020
# Installation Guide:
# Install fftw
mkdir software/fftw3
tar -vxf fftw-3.3.10.tar
cd fftw-3.3.10
./configure --prefix=/home/hj/software/fftw3 --enable-shared=yes
make -j 4
make install
# Install mpich
mkdir software/mpich3
tar -vxf mpich-4.0.1.tar
cd mpich-4.0.1
./configure --prefix=/home/hj/software/mpich3 --enable-shared=yes --disable-fortran
make -j4
make install
# Install LAMMPS
cd software
tar -xvf lammps-stable.tar.gz
cd lammps-3Mar20/src/MAKE
vi Makefile.mpi
Modify the section
CC = g++
LINK = g++
MPI_INC = -DMPICH_SKIP_MPICXX -I/home/hj/software/mpich3/include
MPI_PATH = -L/home/hj/software/mpich3/lib
MPI_LIB = -lmpich -lmpl -lpthread
FFT_INC = -DFFT_FFW3 -DFFT_SINGLE -I/home/hj/software/fftw3/include
FFT_PATH = -L/home/hj/software/fftw3/lib
FFT_LIB = -lfftw3

cd lammps-3Mar20/src
make package-status
make clean all
make no-all
make yes-all
make no-lib
make package-status
make mpi

# Setting up the development environment:
export PATH=/home/hj/software/fftw3/bin:/home/hj/software/mpich3/bin:$PATH
export LD_LIBRARY_PATH=/home/hj/software/fftw3/lib:/home/hj/software/mpich3/lib:$LD_LIBRARY_PATH
export PATH=/home/hj/software/lammps-3Mar20/bin:$PATH
# Instructions for use
nohup mpirun -np 36 ./lmp_mpi < input_27_0.lammps
