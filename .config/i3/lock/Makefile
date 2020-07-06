
deploy:
	ln -s $(shell pwd)/lock.sh /usr/bin/i3lock-color
	ln -s $(shell pwd)/i3lock@.service /etc/systemd/system/i3lock@.service

unlink:
	unlink /usr/bin/i3lock-color
	unlink /etc/systemd/system/i3lock@.service


enable:
	sudo systemctl enable i3lock@$(USER).service
	# sudo systemctl enable i3lock

start:
	sudo systemctl start i3lock@USER

restart:
	sudo systemctl start i3lock@USER

status:
	sudo systemctl status i3lock@USER

verify:
	sudo systemd-analyze verify i3lock@.service
