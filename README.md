# docker-gito

Clone and build:
```
git clone https://github.com/h0tbird/docker-gito.git
cd docker-gito
./bin/build
```

Install and run:
```
sudo ./bin/install
sudo systemctl start gito
```

Tail the output:
```
journalctl -f -u gito
```
