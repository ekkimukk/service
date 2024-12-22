# сервис для дагаева

Если у тебя установлен в Ubuntu make, то просто перейди в директорию с этим репозиторием и настрочи `make`. Затем он должен попросить пароль рута.

Если `make` у тебя не установлен, то перейди в директорию с этим кодом и выполни эти команды поочередно в терминале: 

`sudo cp ./user_manager.service /etc/systemd/system/`
`sudo cp ./script.sh /root/`
`sudo systemctl daemon-reload`
`sudo systemctl enable user_manager.service`
`sudo systemctl status user_manager.service`

Затем поочередно проверь функционал каждой команды:

`sudo /root/script.sh add_user new_user`
`sudo /root/script.sh remove_user old_user`
`sudo /root/script.sh change_permissions new_user sudo`
`sudo /root/script.sh clear_cache new_user`
`sudo /root/script.sh stop_app_by_traffic 1000`


