# SRAM BIST using March C Algorithm (Verilog)

## Overview
This project implements a Built-In Self-Test (BIST) architecture for SRAM using the March C algorithm.

## Features
- Detects stuck-at, transition, and coupling faults
- FSM-based BIST controller
- Parameterized SRAM model
- Self-checking comparator

## March C Algorithm
1. Write 0 (ascending)
2. Read 0, Write 1 (ascending)
3. Read 1, Write 0 (descending)
4. Read 0 (descending)

## Simulation Results
- Address traversal verified (up/down)
- Pass/Fail detection working
- No faults → PASS

## Tools Used
- Verilog HDL
- EDA Playground / ModelSim

## Future Work
- March C+ / March A
- Fault injection
- UVM-based verification
