# Raspberry Pi CS:GO docker
---
this dockerfile build an image that make you able to run a cs:go game server in a docker on a raspberry pi using [box86](https://github.com/anujdatar/box86-docker/).

## Build :
for use this image, you have to clone the repository using this command
```git clone https://github.com/LeBeaufort/raspberry-csgo-docker```
then, you can build it using this commands :
```sh
cd raspberry-csgo-docker
docker build docker build -t csgo-rpi --platform linux/arm/v8 .
```

## Usage :
once you build it, you can run it using this command :

```sh
docker run -d -e EXTRA_ARGS="" -p 27015:27015/udp csgo-rpi
```
Where ```EXTRA_ARGS``` is an environement variable that contain arguments for the csgo game server, such as `+game_mode 0`, `+bot_quota 0` `+mapgroup mg_active`, etc.
Adding bots is not recommended because bots create a lot of lags.

## Features :
- Update : if you want to update the csgo game server, you just have to restart you container.
- Adjustable : If you want to use this stuff for an other server (like, TeamFortress 2 or Counter-Strike 2), you can modify the [steamcmd-script.txt](steamcmd-script.txt). For example if you want a game server for TeamFortress 2, replace this line `app_update 740 validate` to `app_update 232250 validate`. You can refer to this [valve page](https://developer.valvesoftware.com/wiki/Dedicated_Servers_List) for the entire list