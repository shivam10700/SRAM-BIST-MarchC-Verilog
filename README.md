# 🧠 SRAM BIST using March C Algorithm (Verilog)

## 🔍 Overview

This project implements a **Built-In Self-Test (BIST)** architecture for SRAM using the **March C algorithm**, widely used in industry for detecting memory faults.

The design includes a **self-checking mechanism** and demonstrates correct **read-after-write behavior**, addressing real-world memory latency issues.

---

## 🏗️ Architecture

<img width="1536" height="1024" alt="Architecture" src="https://github.com/user-attachments/assets/89e6f3ae-8078-471c-ad29-523ecfe0a3c0" />


### 🔧 Components:

* **BIST Controller (FSM)** – Implements March C sequence
* **Address Generator** – Traverses memory (ascending & descending)
* **Data Generator** – Generates test patterns (0 → 1 → 0)
* **SRAM Model** – Parameterized memory block
* **Comparator** – Verifies memory correctness
* **Pass/Fail Logic** – Indicates test result

---

## 🧠 March C Algorithm

The March C algorithm consists of the following steps:

```
1. ⇑ (w0)       → Write 0 to all addresses
2. ⇑ (r0, w1)   → Read 0, then write 1
3. ⇓ (r1, w0)   → Read 1, then write 0
4. ⇓ (r0)       → Read 0
```

* ⇑ = ascending address order
* ⇓ = descending address order

---

## ⚙️ Key Features

* ✔ Detects:

  * Stuck-at faults
  * Transition faults
  * Address decoder faults
  * Coupling faults

* ✔ FSM-based implementation

* ✔ Parameterized SRAM design

* ✔ Read-before-write timing handled correctly

* ✔ Self-checking comparator using **data tracking approach**

* ✔ Clean waveform verification

---

## 📊 Simulation Waveform

<img width="1357" height="195" alt="Waveform" src="https://github.com/user-attachments/assets/cd60bf10-4d4c-47df-9770-fc27e6415f82" />


### ✅ Observations:

* Address increments and decrements correctly
* Proper state transitions (0 → 1 → 2 → 3)
* Read/write cycles aligned with March C
* `fail = 0` → No fault detected
* `done = 1` → Successful completion

---

## 🛠️ Tools Used

* Verilog HDL
* EDA Playground / Icarus Verilog
* EPWave (Waveform Viewer)
* GitHub

---

## 🧪 Verification Strategy

* Functional verification through waveform analysis
* Timing-aware comparison (handled SRAM read latency)
* Comparator validates data using **last written value tracking**

---

## 🚀 Results

* ✔ Correct execution of March C sequence
* ✔ No false failure detection
* ✔ Fully verified memory test behavior

---

## 🔮 Future Improvements

* 🔹 Fault Injection (stuck-at, transition faults)
* 🔹 SystemVerilog Assertions (SVA)
* 🔹 UVM-based verification environment
* 🔹 Coverage-driven verification

---

## 💼 Resume Highlight

> Designed and verified an SRAM Built-In Self-Test (BIST) using the March C algorithm in Verilog, implementing timing-aware comparison and fault detection mechanisms for memory validation.

---

## 📂 Project Structure

```
sram-bist-marchc/
│
├── rtl/
│   ├── sram.v
│   ├── bist_controller.v
│   ├── data_gen.v
│   ├── comparator.v
│
├── tb/
│   └── bist_top.v
│
├── docs/
│   ├── waveform.png
│   └── architecture.png
│
├── README.md
└── explanation.md
```

