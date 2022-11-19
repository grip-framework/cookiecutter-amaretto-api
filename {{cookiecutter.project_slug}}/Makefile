CRYSTAL_BIN ?= `which crystal`

run:
	$(CRYSTAL_BIN) build --release ./src/process_manager.cr -o bin/{{cookiecutter.project_slug}}
	ENVIRONMENT=production ./bin/{{cookiecutter.project_slug}}
