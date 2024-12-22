all:
	sudo cp ./user_manager.service /etc/systemd/system/
	sudo cp ./script.sh /root/
	sudo systemctl daemon-reload
	sudo systemctl enable user_manager.service
	sudo systemctl status user_manager.service

# docker:
	# docker build -t dudka .
	# docker run --privileged --name test-container -v /sys/fs/cgroup:/sys/fs/cgroup:ro -it dudka

