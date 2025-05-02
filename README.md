<img src="https://github.com/smashembedded.png" alt="Smash Embedded" width="250" height="auto"/>

# IceZUM Alhambra Digital Design Lab
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![GitHub stars](https://img.shields.io/github/stars/smashembedded/icezum-digital-design?style=social)

Design of digital circuits on the IceZUM Alhambra FPGA using Verilog.
This repository offers a curated collection of practical modules (basic and intermediate) — perfect for beginners and tinkerers diving into the world of **open-source FPGA development**.

---

## What’s Inside?

- **Modular Verilog Examples** — From basics to more complex logic blocks.  
- **Simulation & Synthesis Support** — Using 100% open-source tools.  
- **Structured Projects** — Clearly organized directories and modular testbenches.  
- **Educational Focus** — Designed to help you *learn-by-building*.  
- **FTDI-based Upload Flow** — Easily flash your designs with [Apio](https://github.com/FPGAwars/apio).

---


## About the IceZUM Alhambra

<img src="docs/images/icezumAlhambra.jpeg" width="480" alt="IceZUM Alhambra" />

The IceZUM Alhambra is an open-source FPGA development board designed with education and accessibility in mind. It is based on the Lattice iCE40HX1K and was created as part of the [FPGAwars](https://fpgawars.github.io/) initiative, which aims to promote open hardware and digital design education.

If you're curious about the hardware design and background, check out the original project repository:
[FPGAwars / IceZUM-Alhambra](https://github.com/FPGAwars/icezum)

You can purchase the board here:  
**[Buy the IceZUM Alhambra II](https://ultra-lab.net/producto/alhambra-ii-fpga-board-placa/)**

---

## Modules

- [`basic_logic_design`](./basic_logic_design)
  - [`logic_gates`](./basic_logic_design/logic_gates)
    - [`and2`](./basic_logic_design/logic_gates/and2)
    - [`and3`](./basic_logic_design/logic_gates/and3)
    - [`and4`](./basic_logic_design/logic_gates/and4)
    - [`logic_gates2`](./basic_logic_design/logic_gates/logic_gates2)
    - [`or2`](./basic_logic_design/logic_gates/or2)
    - [`or3`](./basic_logic_design/logic_gates/or3)
    - [`or4`](./basic_logic_design/logic_gates/or4)
    - [`xor2`](./basic_logic_design/logic_gates/xor2)
    - [`xor3`](./basic_logic_design/logic_gates/xor3)
    - [`xor4`](./basic_logic_design/logic_gates/xor4)
- [`clock`](./clock)
  - [`freq_divider`](./clock/freq_divider)
- [`combinational_logic_design`](./combinational_logic_design)
  - [`demultiplexers`](./combinational_logic_design/demultiplexers)
    - [`dmux16`](./combinational_logic_design/demultiplexers/dmux16)
    - [`dmux2`](./combinational_logic_design/demultiplexers/dmux2)
    - [`dmux4`](./combinational_logic_design/demultiplexers/dmux4)
    - [`dmux8`](./combinational_logic_design/demultiplexers/dmux8)
  - [`multiplexers`](./combinational_logic_design/multiplexers)
    - [`mux2`](./combinational_logic_design/multiplexers/mux2)
    - [`mux4`](./combinational_logic_design/multiplexers/mux4)
    - [`mux8`](./combinational_logic_design/multiplexers/mux8)
- [`control`](./control)
- [`displays`](./displays)
  - [`lcd`](./displays/lcd)
- [`pwm_generator`](./pwm_generator)
  - [`pwm_gen`](./pwm_generator/pwm_gen)
- [`sensors`](./sensors)
  - [`buttons`](./sensors/buttons)
    - [`button_debouncer`](./sensors/buttons/button_debouncer/)
- [`sequential_logic_design`](./sequential_logic_design)
  - [`pulse_mode_async`](./sequential_logic_design/pulse_mode_async)
    - [`dflipflop_rising`](./sequential_logic_design/pulse_mode_async/dflipflop_rising)
    - [`dflipflop_rising_sync`](./sequential_logic_design/pulse_mode_async/dflipflop_rising_sync)

---

## Required Software Installation

### Icarus Verilog
[Icarus](https://bleyer.org/icarus/) is a free compiler implementation for the IEEE-1364 Verilog hardware description language.
Download and install the next version [iverilog-v12-20220611-x64_setup](https://bleyer.org/icarus/iverilog-v12-20220611-x64_setup.exe). 


### Apio
[Apio](https://github.com/FPGAwars/apio) is an open source ecosystem for open FPGA boards. Is a multiplatform toolbox, with static pre-built packages, project configuration tools and easy command interface to verify, synthesize, simulate and upload verilog dsigns.

```bash
pip install -U apio
apio install -all
```

---

## Quick Start

* Check your verilog code using [Icarus Verilog](https://bleyer.org/icarus/).
```bash
apio verify
```
* Simulate your test bench using [Icarus Verilog](https://bleyer.org/icarus/) and [GTKWave](https://gtkwave.sourceforge.net/)
```bash
apio sim
```
* Syntesize your project using [Icestorm Tools](https://clifford.at/icestorm)
```bash
apio build
```
* Enable FTDI drivers
```bash
apio drivers --ftdi-enable

Launch drivers configuration tool

   FTDI driver installation:
   Usage instructions

      1. Connect the FTDI FPGA board
      2. Select (Interface 0)
      3. Replace driver by "libusbK"
      4. Reconnect the board
      5. Check `apio system --lsftdi`
```
<img src="docs/images/interface0.png" width="480" alt="Interface2" />
<img src="docs/images/interface1.png" width="480" alt="Interface1" />
<img src="docs/images/successfully.png" width="480" alt="Drivers Successfully Installed" />

* Connect your FPGA board and upload the bitstream using [Icestorm Tools](https://clifford.at/icestorm)
```bash
apio upload
```

---

## Dependencies

Make sure the following components are properly installed through Apio and your system's package manager:

| Tool           | Description                     |
|----------------|---------------------------------|
| **Apio CLI**   | FPGA workflow management        |
| **Icestorm**   | open-source Lattice toolchain   |
| **Icarus Verilog** | Simulator & compiler        |
| **GTKWave**    | Waveform viewer (optional)      |

---

## Contributing
Contributions, bug reports, and feature suggestions are welcome.
Feel free to open an issue or submit a pull request to improve the examples, fix bugs, or expand module coverage.

---

## Community & Contact

Got questions?
We'd love to hear from you — whether it's a comment, a suggestion, a collaboration idea, or just a hello!
Reach out at 📧 [smashembedded@gmail.com](mailto:smashembedded@gmail.com) or open a [GitHub issue](https://github.com/smashembedded/icezum-digital-design/issues).

> 💬 Your support matters — not just through funding, but through thoughts, code, feedback, and creativity.
> ⭐ Star this repo and [follow](https://github.com/smashembedded) to stay connected and contribute in any way you can!
---

## License
[GPL-3.0](./LICENSE) © Smash Embedded

---

## Acknowledgements

- [FPGAwars](https://fpgawars.github.io/)
- [Icestorm Tools](https://github.com/YosysHQ/icestorm)
- [Icarus Verilog](https://github.com/steveicarus/iverilog)
- [Apio](https://github.com/FPGAwars/apio)
- [GTKWave](https://gtkwave.sourceforge.net/)
- [DigitalJS](https://digitaljs.tilk.eu/)
- [Fritzing](https://fritzing.org/)
