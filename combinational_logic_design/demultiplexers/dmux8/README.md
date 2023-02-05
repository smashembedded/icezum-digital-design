# DMUX 1:8 Multiplexer

![dmux8 synthesis](./synthesis.png "DMUX 1:8 Synthesis")

## Definition
The demultiplexer (DMUX) is a combinational logic circuit that receives the information on a single input line and transmits the same information over one of n possible output lines. Demultiplexers, also called data distributors, transmit the same data wich is received at the input to different destinations.

This example designs a 1:8 demultiplexer using logic gates. This demultiplexer consists of three select inputs, one data input and eight outputs. Depending on the select signals, the different outputs are activated. The signals are labeled in the following way:
* s0, s1, s2: select inputs.
* d0: data input.
* z0, z1, z2, z3, z4, z5, z6, z7: data outputs.

### Truth Table
|s2 | s1 | s0 | d0 | z7 = f(s2,s1,s0,d0) | z6 = f(s2,s1,s0,d0) | z5 = f(s2,s1,s0,d0) | z4 = f(s2,s1,s0,d0) | z3 = f(s2,s1,s0,d0) | z2 = f(s2,s1,s0,d0) | z1 = f(s2,s1,s0,d0) | z0 = f(s2,s1,s0,d0) |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| **0**|
|0| 0| 0| 1| 0| 0| 0| 0| 0| 0| 0| **1**|
|0| 0| 1| 0| 0| 0| 0| 0| 0| 0| **0**| 0|
|0| 0| 1| 1| 0| 0| 0| 0| 0| 0| **1**| 0|
|0| 1| 0| 0| 0| 0| 0| 0| 0| **0**| 0| 0|
|0| 1| 0| 1| 0| 0| 0| 0| 0| **1**| 0| 0|
|0| 1| 1| 0| 0| 0| 0| 0| **0**| 0| 0| 0|
|0| 1| 1| 1| 0| 0| 0| 0| **1**| 0| 0| 0|
|1| 0| 0| 0| 0| 0| 0| **0**| 0| 0| 0| 0|
|1| 0| 0| 1| 0| 0| 0| **1**| 0| 0| 0| 0|
|1| 0| 1| 0| 0| 0| **0**| 0| 0| 0| 0| 0|
|1| 0| 1| 1| 0| 0| **1**| 0| 0| 0| 0| 0|
|1| 1| 0| 0| 0| **0**| 0| 0| 0| 0| 0| 0|
|1| 1| 0| 1| 0| **1**| 0| 0| 0| 0| 0| 0|
|1| 1| 1| 0| **0**| 0| 0| 0| 0| 0| 0| 0|
|1| 1| 1| 1| **1**| 0| 0| 0| 0| 0| 0| 0|

## Test Bench
![dmux8 tb](./dmux8_tb.png "DMUX 1:8 Test Bench")

## Design
A modular design using two [DMUX 4:1](../dmux4/README.md) and one [DMUX 2:1](../dmux2/README.md) has been chosen to obtain the desired output.
