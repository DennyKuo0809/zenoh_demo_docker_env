# Multiple Autoware with FMS

The script setups several Autoware with zenoh-bridge-dds for FMS test environment.

# Steps

* Install docker compose first: from [official guide](https://docs.docker.com/compose/install/linux/#install-using-the-repository)

```shell
# Install dependencies
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install packages
sudo apt-get install docker-compose-plugin
```

* Build docker images

```shell
./build.sh
```

* Modify the `docker-compose.yaml` for your requirement
  - For example, `VEHICLE_NAME` or `FMS_CONNECTION`

* Run docker-compose

```shell
xhost +
docker compose up
```

* Run FMS: https://github.com/evshary/zenoh_autoware_fms

* Stop docker-compose

```shell
docker compose down
```

* Clean environment

```shell
./clean.sh
```

* Debug (Go inside the docker container)

```shell
./run.sh
```

