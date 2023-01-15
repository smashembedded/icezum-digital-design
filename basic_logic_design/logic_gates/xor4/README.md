# XOR 4:1 Gate

![xor4 synthesis](./synthesis.png "XOR 4:1 Synthesis")

## Definition
The XOR 4:1 gate is a basic digital logic gate that implements exclusive disjunction. 

### Truth Table
|x0 | x1 | x2 | x3 |z2 = f(x0,x1,x2,x3)|
|:---:|:---:|:---:|:---:|:---:|
|0| 0| 0| 0| 0|
|0| 0| 0| 1| 1|
|0| 0| 1| 0| 1|
|0| 0| 1| 1| 0|
|0| 1| 0| 0| 1|
|0| 1| 0| 1| 0|
|0| 1| 1| 0| 0|
|0| 1| 1| 1| 1|
|1| 0| 0| 0| 1|
|1| 0| 0| 1| 0|
|1| 0| 1| 0| 0|
|1| 0| 1| 1| 1|
|1| 1| 0| 0| 0|
|1| 1| 0| 1| 1|
|1| 1| 1| 0| 1|
|1| 1| 1| 1| 0|

## Test Bench
![xor4 tb](./xor4_tb.png "XOR 4:1 Test Bench")

## Design
A modular design using three [XOR 2:1](../xor2/README.md) logic gates has been chosen to obtain the desired output.