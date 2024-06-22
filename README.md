## 32 Bit MIPS Processor
The MIPS (Microprocessor without Interlocked Pipeline Stages) processor is a 32-bit architecture designed for efficient and streamlined execution of instructions. 
Known for its simplicity and clarity, MIPS processors are widely used in embedded systems, educational environments,
and research due to their balanced instruction set, clear pipeline structure, and emphasis on performance per watt.
This project explores the design, simulation, and verification of a 32-bit MIPS processor using Verilog HDL, aiming to demonstrate its fundamental computing capabilities and adherence to MIPS ISA standards.

## Architecture

![obrazek](https://github.com/faatthy/32-bit-MIPS-Processor/assets/110846097/86bc9175-4ae6-46ae-8b94-4609f5d394fa)

## Instructions Set

<!DOCTYPE html>
<html>
<head>
<style>
  table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
  }
  th, td {
    padding: 5px;
    text-align: left;
  }
</style>
</head>
<body>

<table style="width:100%">
  <caption>Bits Used Per Instruction</caption>
  <tr>
    <th></th>
    <th>6 bits</th>
    <th>5 bits</th>
    <th>5 bits</th>
    <th colspan="2">5 bits</th>
    <th>6 bits</th>
    <th>Total of 32 bits</th>
  </tr>
  <tr>
    <th>Inst.</th>
    <th>Opcode</th>
    <th>rs</th>
    <th>rt</th>
    <th>rd</th>
    <th>shamt</th>
    <th>funct</th>
    <th></th>
  </tr>
  <tr>
    <th></th>
    <th></th>
    <th>bits</th>
    <th>bits</th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
  </tr>
  <tr>
    <th>add</th>
    <td>000000</td>
    <td>used</td>
    <td>used</td>
    <td>used</td>
    <td>X</td>
    <td>100000</td>
    <td>Reg[rd]=Reg[rs]+Reg[rt]</td>
  </tr>
  <tr>
    <th>sub</th>
    <td>000000</td>
    <td>used</td>
    <td>used</td>
    <td>used</td>
    <td>00000</td>
    <td>100010</td>
    <td>Reg[rd]=Reg[rs]-Reg[rt]</td>
  </tr>
  <tr>
    <th>and</th>
    <td>000000</td>
    <td>used</td>
    <td>used</td>
    <td>used</td>
    <td>X</td>
    <td>100100</td>
    <td>Reg[rd]=Reg[rs] and Reg[rt]</td>
  </tr>
  <tr>
    <th>or</th>
    <td>000000</td>
    <td>used</td>
    <td>used</td>
    <td>used</td>
    <td>X</td>
    <td>100101</td>
    <td>Reg[rd]=Reg[rs] or Reg[rt]</td>
  </tr>
  <tr>
    <th>slt</th>
    <td>000000</td>
    <td>used</td>
    <td>used</td>
    <td>used</td>
    <td>00000</td>
    <td>101010</td>
    <td>If(Reg[rs]<Reg[rt]) Reg[rd]=1  <br>
    else 0</td>
  </tr>
  <tr>
    <th>sll</th>
    <td>000000</td>
    <td>X</td>
    <td>used</td>
    <td>used</td>
    <td>used</td>
    <td>000000</td>
    <td>Reg[rd]=Reg[rs]<<shamt</td>
  </tr>
  <tr>
    <th>srl</th>
    <td>000000</td>
    <td>X</td>
    <td>used</td>
    <td>used</td>
    <td>used</td>
    <td>000010</td>
    <td>Reg[rd]=Reg[rs]>>shamt</td>
  </tr>
  <tr>
    <th>clo</th>
    <td>011100</td>
    <td>used</td>
    <td>not</td>
    <td>used</td>
    <td>X</td>
    <td>100001</td>
    <td>Reg[rd]=count_ones(Reg[rs])</td>
  </tr>
  <tr>
    <th>clz</th>
    <td>011100</td>
    <td>used</td>
    <td>not</td>
    <td>used</td>
    <td>X</td>
    <td>100000</td>
    <td>Reg[rd]= count_zeros(Reg[rs])</td>
  </tr>
  <tr>
    <th>mul</th>
    <td>011100</td>
    <td>used</td>
    <td>used</td>
    <td>used</td>
    <td>X</td>
    <td>000010</td>
    <td>Reg[rd]=Reg[rs]*Reg[rt]</td>
  </tr>
  <tr>
    <th>rotr</th>
    <td>000000</td>
    <td>used</td>
    <td>used</td>
    <td>used</td>
    <td>X</td>
    <td>000110</td>
    <td>Reg[rd]= Reg[rt] <br>
</table>

</body>
</html>

## Initialization
        # Instructiom Memory Initialization 
        dut.imem.memory[0] = 32'b000000_01010_01011_01001_00000_100000; // ADD $t1, $t2, $t3
        dut.imem.memory[1] = 32'b000000_01010_01011_01001_00000_100010; // SUB $t1, $t2, $t3
        dut.imem.memory[2] = 32'b000000_01010_01011_01001_00000_100100; // AND $t1, $t2, $t3
        dut.imem.memory[3] = 32'b000000_01010_01011_01001_00000_100101; // OR $t1, $t2, $t3
        dut.imem.memory[4] = 32'b000000_01010_01011_01001_00000_101010; // SLT $t1, $t2, $t3
        dut.imem.memory[5] = 32'b100011_01010_01001_0000000000000100;   // LW $t1, 4($t2)
        dut.imem.memory[6] = 32'b101011_01010_01001_0000000000000100;   // SW $t1, 4($t2)
        dut.imem.memory[7] = 32'b000100_01001_01010_0000000000000010;   // BEQ $t1, $t2, 2

        # Register File Initialization 
        dut.rf.registers[9] = 32'h00000001; // $t1
        dut.rf.registers[10] = 32'h00000002; // $t2
        dut.rf.registers[11] = 32'h00000003; // $t3
## Waveform

![image](https://github.com/faatthy/32-bit-MIPS-Processor/assets/110846097/10c4d3d3-ae0a-42ef-87fd-a529d17f97d2)

## Test Cases Results

. After ADD instruction:                     ADD instruction passed!
. After SUB instruction:                     SUB instruction passed!
. After AND instruction:                     AND instruction passed!
. After OR instruction:                      OR instruction passed!
. After SLT instruction:                     SLT instruction passed!
. After LW instruction:                      LW instruction passed!
. After SW instruction:                      SW instruction passed!
. After BEQ instruction:                     BEQ instruction passed!
