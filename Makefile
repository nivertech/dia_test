REBAR=./rebar

.PHONY:

all:
	$(REBAR) get-deps compile

## add your dependecies here. --apps [depencencies from otp] -r [our deps]
init_dialyzer:
	dialyzer --apps stdlib kernel -r deps --build_plt --output_plt .dialyzer.plt

dialyzer:
	dialyzer --no_native -Wno_return -r ebin --plt .dialyzer.plt

help:
	@echo "Commands:"
	@echo "  Build the system:  \t make"
	@echo "  Setup dialyzer:   \t make init_dialyzer"
	@echo "  Run dialyzer:   \t make dialyzer"