
install:
	./install.sh

deploy:
	./deploy.sh

clean:
	./unlink.sh

github_ssh:
	ssh-keygen -t rsa -f $(HOME)/.ssh/id_github_ras
	cat git_ssh_config >> $(HOME)/.ssh/config

github_check:
	ssh -T git@github.com
