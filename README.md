<img src="https://github.com/smashembedded.png" alt="Smash Embedded" width="250" height="auto"/>

# IceZUM Alhambra Digital Design
[![License](https://img.shields.io/github/license/smashembedded/icezum-digital-design)](./LICENSE)
![GitHub stars](https://img.shields.io/github/stars/smashembedded/icezum-digital-design?style=social)

Design of digital circuits on the IceZUM Alhambra FPGA using Verilog.
This repository provides practical examples for deploying basic and intermediate digital modules to help hobbyists
get hands-on experience with FPGA design.

---

## About the IceZUM Alhambra

<img src="docs/images/icezumAlhambra.jpeg" width="480" alt="IceZUM Alhambra" />

The IceZUM Alhambra is an open-source FPGA development board designed with education and accessibility in mind. It is based on the Lattice iCE40HX1K and was created as part of the [FPGAwars](https://fpgawars.github.io/) initiative, which aims to promote open hardware and digital design education.

If you're curious about the hardware design and background, check out the original project repository:
[FPGAwars / IceZUM-Alhambra](https://github.com/FPGAwars/icezum)

---

## Features

- Digital design examples in Verilog for IceZUM Alhambra.
- Simulation and synthesis using open-source tools.
- Structured project folders for different logic types.
- FTDI-based programming flow using Apio.
- Educational focus with modular testbenches.

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

- Apio CLI (pip install apio)

- Icestorm tools: arachne-pnr, yosys, icepack, iceprog

- GTKWave (optional for waveform viewing)

- Icarus Verilog (iverilog, vvp)

---

## Contributing
Contributions, bug reports, and feature suggestions are welcome.
Feel free to open an issue or submit a pull request to improve the examples, fix bugs, or expand module coverage.

---

## Support

GitHub Sponsors coming soon!  
⭐ this repo or [follow me](https://github.com/smashembedded) to stay updated.

---

## Contact
Questions or ideas?
Reach out via [email](mailto:smashembedded@gmail.com) or open an issue on GitHub.

---

## License
[GPL-3.0](LICENSE) © Smash Embedded

---

## Credits

- [FPGAwars](https://fpgawars.github.io/)
- [Icestorm Tools](https://github.com/YosysHQ/icestorm)
- [Icarus Verilog](https://github.com/steveicarus/iverilog)
- [Apio](https://github.com/FPGAwars/apio)
- [GTKWave](https://gtkwave.sourceforge.net/)

