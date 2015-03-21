# docker-gito

Clone and build:
```
git clone https://github.com/h0tbird/docker-gito.git
cd docker-gito
./bin/build
```

Install and run:
```
sudo ln gito.service /etc/systemd/system/gito.service
sudo ln bin/runctl /usr/local/sbin/runctl-gito
sudo mkdir /etc/bootpaas
sudo cp gito.conf /etc/bootpaas
sudo systemctl daemon-reload
sudo systemctl start gito
```

Tail the output:
```
journalctl -f -u gito
```
