# rp2040-rtos

A lightweight, bare-metal Real-Time Operating System (RTOS) built from scratch for the Raspberry Pi Pico (RP2040 microcontroller). 

Written entirely in [Zig](https://ziglang.org/), this project explores low-level ARM Cortex-M0+ architecture, custom memory mapping, and direct hardware manipulation without relying on external C/C++ SDKs or standard frameworks. 

## Overview
Currently in active development, this project aims to implement core RTOS features (like task scheduling and hardware interrupts) directly at the register level, starting from a custom memory linker and build system.
