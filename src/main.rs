#![no_main]
#![no_std]
use core::format_args;
use core::panic::PanicInfo;

use oso::println;
/// This function is called on panic.
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    println!("{}", info);
    loop {}
}

#[unsafe(no_mangle)]
pub extern "C" fn _start() -> ! {
    println!("LOLOL");

    oso::init();

    // invoke a breakpoint exception
    x86_64::instructions::interrupts::int3();
    loop {}
}
