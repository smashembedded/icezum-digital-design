# D Flip Flop

![dflipflop synthesis](./synthesis.png "D Flip Flop Synthesis")

## Definition
The Delay (D) Flip Flop is a digital electronic circuit used to delay the change of state of ists output signal (Q) until a clock timing event input signal occurs.

The D Flip Flop acts as an electronic memory component since the output remains constant unless deliberately changed by altering the state of the D input followed by a rising clock signal.

In this example, a data Latch 

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
![dflipflop tb](./dflipflop_tb.png "D Flip Flop Test Bench")

## Design
A modular design using two [DMUX 1:4](../dmux4/README.md) and one [DMUX 1:2](../dmux2/README.md) has been chosen to obtain the desired output.
