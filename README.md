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
  <tr>
    <th>Inst.</th>
    <th>Opcode</th>
    <th>rs</th>
    <th>rt</th>
    <th>rd</th>
    <th>shamt</th>
    <th>funct</th>
    <th>Expression</th>
  </tr>
  <tr>
    <td>add</td>
    <td>000000</td>
    <td>used</td>
    <td>used</td>
    <td>used</td>
    <td>X</td>
    <td>100000</td>
    <td>Reg[rd]=Reg[rs]+Reg[rt]</td>
  </tr>
  <tr>
    <td>sub</td>
    <td>000000</td>
    <td>used</td>
    <td>used</td>
    <td>used</td>
    <td>00000</td>
    <td>100010</td>
    <td>Reg[rd]=Reg[rs]-Reg[rt]</td>
  </tr>
  </table>

</body>
</html>
