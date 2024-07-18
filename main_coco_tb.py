# Tutorial for cocotb on: https://docs.cocotb.org/en/stable/quickstart.html

import cocotb
import time
import cocotb
from cocotb.triggers import Timer, FallingEdge

PERIOD = 37.037  # in ns, based on a 26 MHz clock

async def generate_clock(dut):
    """Generate clock pulses."""

    #for cycle in range(9999):
    while(1):
        dut.clk_i.value = 0
        await Timer(PERIOD, units="ns")
        dut.clk_i.value = 1
        await Timer(PERIOD, units="ns")


@cocotb.test()
async def my_first_test(dut):
    dut.rst_ni.value = 0
    dut.prescaler_i.value = 127  # Clock should now be 216 kHz

    await cocotb.start(generate_clock(dut))  # run the clock in the background.

    await Timer(5, units="ns")  # wait a bit
    await FallingEdge(dut.clk_i)  # wait for falling edge/"negedge"

    dut._log.info(f"reset is {dut.rst_ni.value}.")

    await Timer(50, units='ns')
    dut.rst_ni.value = 1

    await Timer(10*PERIOD, units='ns')

    # Measure the clk_div clock frequency
    await FallingEdge(dut.clk_div)
    time_start = cocotb.utils.get_sim_time(units='ns')

    await FallingEdge(dut.clk_div)
    time_end = cocotb.utils.get_sim_time(units='ns')
    time_delta = time_end - time_start
    print(f"Time_delta = {time_delta} ns.")
    # Measure done

    await Timer(10*PERIOD, units='ns')

    assert time_delta / PERIOD == 128, "Clock division is not correct!"
    assert dut.rst_ni.value[0] == 1, "rst_ni is not 0!"
