# See main.m for more information about valid args
# Execution example: make run ARGS=plot
run:
	@cd ./src && octave --silent --eval 'main("$(ARGS)")'

last-entries:
	@tail -n 10 ./data/covid19_argentina.csv
