#![feature(abi_x86_interrupt)]
#![no_std]

pub mod interrupts;

#[macro_use]
pub mod vga_buffer;

#[macro_use]
extern crate core;

pub fn init() {
    interrupts::init_idt();
}
