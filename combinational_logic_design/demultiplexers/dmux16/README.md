# DMUX 1:16 Multiplexer

![dmux16 synthesis](./synthesis.png "DMUX 1:16 Synthesis")

## Definition
The demultiplexer (DMUX) is a combinational logic circuit that receives the information on a single input line and transmits the same information over one of n possible output lines. Demultiplexers, also called data distributors, transmit the same data wich is received at the input to different destinations.

This example designs a 1:8 demultiplexer using logic gates. This demultiplexer consists of four select inputs, one data input and sixteen outputs. Depending on the select signals, the different outputs are activated. The signals are labeled in the following way:
* s0, s1, s2, s3: select inputs.
* d0: data input.
* z0, z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11, z12, z13, z14, z15: data outputs.

### Truth Table
| s3 | s2 | s1 | s0 | d0 | z15 = f(s3,s2,s1,s0,d0) | z14 = f(s3,s2,s1,s0,d0) | z13 = f(s3,s2,s1,s0,d0) | z12 = f(s3,s2,s1,s0,d0) | z11 = f(s3,s2,s1,s0,d0) | z10 = f(s3,s2,s1,s0,d0) | z9 = f(s3,s2,s1,s0,d0) | z8 = f(s3,s2,s1,s0,d0) | z7 = f(s3,s2,s1,s0,d0) | z6 = f(s3,s2,s1,s0,d0) | z5 = f(s3,s2,s1,s0,d0) | z4 = f(s3,s2,s1,s0,d0) | z3 = f(s3,s2,s1,s0,d0) | z2 = f(s3,s2,s1,s0,d0) | z1 = f(s3,s2,s1,s0,d0) | z0 = f(s3,s2,s1,s0,d0) |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0| 0| 0| 0| **D0** | 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| **D0**|
|0| 0| 0| 1| **D1** | 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| **D1**| 0|
|0| 0| 1| 0| **D2** | 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| **D2**| 0| 0|
|0| 0| 1| 1| **D3** | 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| **D3**| 0| 0| 0|
|0| 1| 0| 0| **D4** | 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| **D4**| 0| 0| 0| 0|
|0| 1| 0| 1| **D5** | 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| **D5**| 0| 0| 0| 0| 0|
|0| 1| 1| 0| **D6** | 0| 0| 0| 0| 0| 0| 0| 0| 0| **D6**| 0| 0| 0| 0| 0| 0|
|0| 1| 1| 1| **D7** | 0| 0| 0| 0| 0| 0| 0| 0| **D7**| 0| 0| 0| 0| 0| 0| 0|
|1| 0| 0| 0| **D8** | 0| 0| 0| 0| 0| 0| 0| **D8**| 0| 0| 0| 0| 0| 0| 0| 0|
|1| 0| 0| 1| **D9** | 0| 0| 0| 0| 0| 0| **D9**| 0| 0| 0| 0| 0| 0| 0| 0| 0|
|1| 0| 1| 0| **D10**| 0| 0| 0| 0| 0| **D10**| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0|
|1| 0| 1| 1| **D11**| 0| 0| 0| 0| **D11**| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0|
|1| 1| 0| 0| **D12**| 0| 0| 0| **D12**| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0|
|1| 1| 0| 1| **D13**| 0| 0| **D13**| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0|
|1| 1| 1| 0| **D14**| 0| **D14**| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0|
|1| 1| 1| 1| **D15**| **D15**| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0| 0|

## Test Bench
![dmux16 tb](./dmux16_tb.png "DMUX 1:16 Test Bench")

## Design
A modular design using two [DMUX 1:8](../dmux8/README.md) and one [DMUX 1:2](../dmux2/README.md) has been chosen to obtain the desired output.
