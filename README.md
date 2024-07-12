# Timer Peripheral on Tang Nano 9k
This is a simple timer peripheral similar to what you may encounter in various (read: simple) MCUs. The repository is largely inspired by STMicroelectronic's AN4776 [General-purpose timer cookbook fro STM32 microcontrollers](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www.st.com/resource/en/application_note/an4776-generalpurpose-timer-cookbook-for-stm32-microcontrollers-stmicroelectronics.pdf&ved=2ahUKEwi2mpGzkKKHAxU-FRAIHYWdCW0QFnoECBEQAQ&usg=AOvVaw2O5qIAXRo2sjo6grPN4_LH).

This proves as a good learning ground for working with the Tang Nano 9k as well as digital design, all this coming from an analog/mixed-signal IC designer.


## Prerequisites
- Tang Nano 9k FPGA development board
- Working installation of [oss-cad-suite](https://github.com/YosysHQ/oss-cad-suite-build)

## Simulate testbench

## Build the FPGA
To use this, simply plug-in your FPGA development and run the following commands via the `makefile`:
```
make synth
make pnr
make bitstream
make program
```

Do you hate typing? You can also use the `make all`:
```
make all
make program
```

If you want to start over, you can `clean`:
```
make clean
```

