// Baud generator
//`include "baudgen/baudgen.vh"
`include "baudgen/baudgen_tx.v"
`include "baudgen/baudgen_rx.v"

// UART TX
`include "uart_tx/uart_tx.v"
`include "uart_tx/uart_ctrl_tx.v"
`include "uart_tx/uart_msg_tx.v"

// UART RX
`include "uart_rx/uart_rx.v"
`include "uart_rx/uart_ctrl_rx.v"
`include "uart_rx/uart_msg_rx.v"