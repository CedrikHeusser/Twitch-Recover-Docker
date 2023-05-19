# Twitch-Recover-Docker

This projects extends [TwitchRecover](https://github.com/TwitchRecover/TwitchRecover) to run it inside a Docker container.
It has `wfuzz` preinstalled, so that you do not have to care about dependencies.


## How To Use

### Prepare

You need to have the `Twitch.Recover.jar` available in this directory before you can build the docker image.
You can download it from the [releases](https://github.com/TwitchRecover/TwitchRecover/releases) page or use

```shell
curl -s https://api.github.com/repos/TwitchRecover/TwitchRecover/releases/latest \
| grep "browser_download_url.*Twitch.Recover.jar" \
| grep -v '.sig' \
| cut -d : -f 2,3 \
| tr -d \" \
| xargs -L 1 curl -LJO
```

I decided to not include the download of the `Twitch.Recover.jar` in the Dockerfile since this gives flexibility on what version to run.


### Build

```shell
docker build . -t twitch-recover:latest
# or
./build.sh
```

### Run

```shell
docker run -it --rm -v ./results:/results twitch-recover:latest
# or
./run.sh
```

If the program asks for a file path location (to save your VOD, Clip, ...), type ONLY `results/` as path, for example:

```
Please enter the FILE PATH of where you want the VOD saved:
File path: results/
```

Your VOD, Clip, etc., will then be stored in the `results` folder, that is mapped to your current machine (check the `-v` flag in the `docker run` command).


## Compatibility

I only tested VODs. Clips don't seem to work becuase they get a really weird filname (that might work on Windows machines?). And I've only tested this on macOS.
