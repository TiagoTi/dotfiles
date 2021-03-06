run: build_container
	docker run -itd -v $PWD:/root/.yadr/ --name dotfiles yard:v0


build_container: remove_container
	@eval "docker build --file DockerfileBaseDev -t basedev:v0 ."
	@sed "s/\([0-9]\+\)/$(date +%y%m%d%H%M%S)/" Dockerfile
	@docker build --rm --no-cache -t yard:v0 .


remove_container:
	@docker rm -f dotfiles; echo 'force exit 0'




sh: run
	@docker exec -it dotfiles zsh