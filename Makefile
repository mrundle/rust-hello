.DEFAULT_GOAL := usage
.PHONY: build run clean

CARGO_BUILD_COMMANDS_PRIMARY = \
	build \
	clean \
	run

CARGO_BUILD_COMMANDS_SECONDARY = \
	bench   					 \
	check   					 \
	doc     					 \
	fetch   					 \
	fix     					 \
	report  					 \
	rustc   					 \
	rustdoc 					 \
	test

CARGO_BUILD_COMMANDS = \
	$(CARGO_BUILD_COMMANDS_PRIMARY) \
	$(CARGO_BUILD_COMMANDS_SECONDARY)

$(CARGO_BUILD_COMMANDS):
	cargo $@

usage:
	@echo "Choose make target...\n"
	@echo "Primary =>"
	@for cmd in $(CARGO_BUILD_COMMANDS_PRIMARY); do \
		echo "    $(notdir $(MAKE)) $$cmd\t- runs 'cargo $$cmd'"; \
	done
	@echo "\nSecondary =>"
	@for cmd in $(CARGO_BUILD_COMMANDS_SECONDARY); do \
		echo "    $(notdir $(MAKE)) $$cmd\t- runs 'cargo $$cmd'"; \
	done
