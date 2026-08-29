# VHDL Microcontroller Subsystem

A VHDL implementation of a minimal microcontroller subsystem composed of an **Instruction Register (RI)** and a **Sequencer**.

## Project Overview

The system contains two main subsystems:

- **Instruction Register (RI)** – receives a 12-bit instruction from memory and extracts the operation code and the addresses of two operands.
- **Sequencer** – controls the instruction register and the Arithmetic Logic Unit (ALU) through a finite state machine.

A structural architecture connects both subsystems.

## Instruction Format

The 12-bit `DataMem` input is divided into three 4-bit fields:

```text
┌────────────┬────────────┬────────────┐
│ CodeOp     │    Op1     │    Op2     │
│ 11 downto 8│  7 downto 4│ 3 downto 0 │
└────────────┴────────────┴────────────┘
```

When `ERI = '1'` on the rising edge of the clock:

- `CodeOperation` receives `DataMem(11 downto 8)`
- `Operande1` receives `DataMem(7 downto 4)`
- `Operande2` receives `DataMem(3 downto 0)`

## Sequencer

The sequencer is implemented as a finite state machine with three states:

- `init`
- `fetch`
- `execute`

Main control signals:

- `MemR` – indicates that memory data is available
- `OpDone` – indicates that the current ALU operation is complete
- `CRI` – controls the Instruction Register
- `CUAL` – controls the ALU

## Structural Architecture

`src/structurelle.vhd` connects the Instruction Register and Sequencer.

```text
                    ┌─────────────────────┐
      DataMem ─────►│ Instruction Register│
      H ───────────►│        (RI)         │
                    └──────────┬──────────┘
                               │
                    Operande1  │  Operande2
                    CodeOperation
                               │
                    ┌──────────▼──────────┐
      MemDone ─────►│      Sequencer      │──────► exeUAL
      UALDone ─────►│                     │
      H ───────────►│                     │
                    └─────────────────────┘
```

## Project Structure

```text
VHDL-Microcontroller-Subsystem/
├── src/
│   ├── RI.vhd
│   ├── sequenceur.vhd
│   └── structurelle.vhd
├── testbench/
├── simulation/
├── README.md
└── .gitignore
```

## Tools

The project can be simulated with a VHDL-compatible simulator such as:

- ModelSim / Questa
- Vivado
- GHDL

## Learning Objectives

- VHDL entity and architecture design
- Instruction register implementation
- Bit-vector slicing
- Finite State Machines
- Synchronous clocked processes
- Component instantiation
- Structural VHDL design
- Digital microcontroller architecture