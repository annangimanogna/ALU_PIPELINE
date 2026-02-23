# ALU_PIPELINE

##  Problem Statement

Design and implement a pipelined Arithmetic Logic Unit (ALU) using Verilog HDL that supports multiple arithmetic and logical operations.

The ALU must:

- Support operations such as:
  - Addition  
  - Subtraction  
  - Bitwise AND  
  - Bitwise OR  
  - Bitwise XOR  
- Use a multi-stage pipeline architecture  
- Improve throughput by processing operations in parallel stages  
- Store intermediate results using pipeline registers  
- Be verified using a Verilog testbench  

The goal of this project is to understand pipelining at the RTL level and implement it using synchronous digital design principles.

---

##  Design Approach

### Operation Selection

The ALU performs operations based on an opcode (control signal).  
Each opcode corresponds to a specific arithmetic or logical function.

Example mapping:

| Opcode | Operation |
|--------|----------|
| 000    | Addition |
| 001    | Subtraction |
| 010    | AND |
| 011    | OR |
| 100    | XOR |

The opcode is provided along with input operands.

---

###  Pipeline Architecture

Instead of completing an operation in a single clock cycle, the ALU is divided into three pipeline stages.

###  Stage 1 – Operand Fetch
- Captures input operands and opcode  
- Stores them into pipeline registers  
- Prepares inputs for execution  

###  Stage 2 – Execute
- Performs the selected operation  
- Computes arithmetic or logical result  
- Stores intermediate result in the next pipeline register  

### Stage 3 – Writeback
- Transfers final result to output register  
- Makes output available after pipeline delay  

Because of pipelining:
- A new input can be applied every clock cycle  
- Multiple operations can be processed simultaneously at different stages  

---

### Pipeline Registers

Registers are inserted between stages to:

- Hold intermediate values  
- Maintain synchronization  
- Ensure stable data transfer  
- Support clock-based operation  

All registers operate on the positive edge of the clock.

---

###  Hazard Assumption

This implementation assumes:

- Each ALU operation is independent  
- No data dependency exists between consecutive inputs  

Therefore, hazard detection or forwarding logic is not included.

---

###  Verification Strategy

The design is verified using a Verilog testbench.

The testbench performs:

- Clock generation  
- Reset initialization  
- Application of multiple operand combinations  
- Testing of all supported opcodes  
- Monitoring outputs across pipeline cycles  

Waveform analysis is used to confirm correct stage-wise execution and output timing.

---

##  Design Goals

- Demonstrate pipelining in RTL  
- Improve throughput using stage-based execution  
- Maintain modular and synthesizable Verilog code  
- Ensure correct timing behavior  
- Validate functionality through simulation  

---

##  Concepts Used

- RTL Design  
- Synchronous Sequential Logic  
- Pipeline Architecture  
- Register Transfer Level Modeling  
- Verilog Testbench Development  
- Digital Arithmetic and Logic Operations  

---

##  Learning Outcomes

Through this project, the following concepts were implemented:

- Dividing a design into pipeline stages  
- Managing stage-to-stage data flow  
- Understanding pipeline latency and throughput  
- Writing clean and synthesizable Verilog  
- Performing functional verification using simulation  
