.PHONY: build-thumbv7em
build-thumbv7em:
	cargo build --target thumbv7em-none-eabihf

.PHONY: build
build:
	cargo build --target x86_64-oso.json 

.PHONY: setup
setup:
	brew install qemu && rustup update && rustup install nightly