# DMUX 1:2 Demultiplexer

![dmux2 synthesis](./synthesis.png "DMUX 1:2 Synthesis")

## Definition
The demultiplexer (DMUX) is a combinational logic circuit that receives the information on a single input line and transmits the same information over one of n possible output lines. Demultiplexers, also called data distributors, transmit the same data wich is received at the input to different destinations.

This example designs a 1:2 demultiplexer using logic gates. This demultiplexer consists of one select input, one data input and two outputs. Depending on the select signal, the different outputs are activated. The signals are labeled in the following way:
* s0: select input.
* d0: data input.
* z0, z1: data outputs.

### Truth Table
|s0 | d0 | z1 = f(s0, d0) | z0 = f(s0,d0)|
|:---:|:---:|:---:|:---:|
|0| 0| 0| **0**|
|0| 1| 0| **1**|
|1| 0| **0**| 0|
|1| 1| **1**| 0|

## Test Bench
![dmux2 tb](./dmux2_tb.png "DMUX 1:2 Test Bench")

## Design
A modular design using two [AND 2:1](../../../basic_logic_design/logic_gates/and2/README.md) logic gates has been chosen to obtain the desired output.