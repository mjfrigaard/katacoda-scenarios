Katacoda - Deploying Your First Docker Container
==============

#projects #command-line #URGENT

- - - -

These are the notes for part 1 of [Learn Docker & Containers using Interactive Browser-Based Labs | Katacoda](https://katacoda.com/courses/docker). 

## Docker notes (Katacoda)

> In this first scenario, you’ll take the role of Jane, a developer who needs to deploy a new Key-Value Store for an application she’s working with. After discussions, it’s been decided to use Redis, a popular KV Store.  

> Jane is unfamiliar with how Redis is deployed but has heard Docker makes it straightforward to deploy services into development and production.  

> **This scenario discusses how she will complete her task and deploy Redis as a Docker Container.** Jane’s development environment has access to latest version of the Docker Engine via a machine called *docker*. Her local dev machine has the Docker Client installed and accessible via the command line.  

## What Is Docker?

> Docker describes themselves as “**an open platform for developers and sysadmins to build, ship, and run distributed applications**”.  
> Docker allows you to run containers. **A container is a sandboxed process running an application and its dependencies on the host operating system.** The application inside the container considers itself to be the only process running on the machine while the machine can run multiple containers independently.  

More on Docker from Docker in Action (2019),

> *Docker isn’t a programming language, and it isn’t a framework for building software. Docker is a tool that helps solve common problems such as installing, removing, upgrading, distributing, trusting, and running software. It’s open source Linux software, which means that anyone can contribute to it and that it has benefited from a variety of perspectives.*  

## Installing Docker

I installed docker with homebrew following the instructions [here](https://medium.com/@yutafujii_59175/a-complete-one-by-one-guide-to-install-docker-on-your-mac-os-using-homebrew-e818eb4cfc3). 

### Upgrade homebrew:

```bash
$ # first update homebrew 
$ brew upgrade 
# address this error: 
# Error: The following directories are not writable by your user:
# /usr/local/share/info

# You should change the ownership of these directories to your user.
#   sudo chown -R $(whoami) /usr/local/share/info

# And make sure that your user has write permission.
#   chmod u+w /usr/local/share/info
$ sudo chown -R $(whoami) /usr/local/share/info
Password:
$ chmod u+w /usr/local/share/info
$ # now install docker 
```

### Installing `docker-machine`

```bash
$ brew install docker docker-machine
# ==> Downloading https://homebrew.bintray.com/bottles/docker-19.03.8.catalina.bot
# ==> Downloading from https://akamai.bintray.com/19/198515494e343db1d955f7027ba81
# ######################################################################## 100.0%
# ==> Pouring docker-19.03.8.catalina.bottle.tar.gz
# ==> Caveats
# Bash completion has been installed to:
#   /usr/local/etc/bash_completion.d

# zsh completions have been installed to:
#   /usr/local/share/zsh/site-functions
# ==> Summary
# 🍺  /usr/local/Cellar/docker/19.03.8: 14 files, 74.7MB
# ==> `brew cleanup` has not been run in 30 days, running now...
# Pruned 2 symbolic links from /usr/local
# ==> Downloading https://homebrew.bintray.com/bottles/docker-machine-0.16.2.catal
# ==> Downloading from https://akamai.bintray.com/99/99b50d9809a0aa881e01686e3356f
# ######################################################################## 100.0%
# ==> Pouring docker-machine-0.16.2.catalina.bottle.tar.gz
# ==> Caveats
# Bash completion has been installed to:
#   /usr/local/etc/bash_completion.d

# zsh completions have been installed to:
#   /usr/local/share/zsh/site-functions

# To have launchd start docker-machine now and restart at login:
#   brew services start docker-machine
# Or, if you don't want/need a background service you can just run:
#   docker-machine start
# ==> Summary
# 🍺  /usr/local/Cellar/docker-machine/0.16.2: 11 files, 36MB
# ==> Caveats
# ==> docker
# Bash completion has been installed to:
#   /usr/local/etc/bash_completion.d

# zsh completions have been installed to:
#   /usr/local/share/zsh/site-functions
# ==> docker-machine
# Bash completion has been installed to:
#   /usr/local/etc/bash_completion.d

# zsh completions have been installed to:
#   /usr/local/share/zsh/site-functions

# To have launchd start docker-machine now and restart at login:
#   brew services start docker-machine
# Or, if you don't want/need a background service you can just run:
#   docker-machine start
```

### Installing `virtualbox`

This installation uses the `cask` install commands for homebrew. The first attempt was an error, but after updating the system preferences, I was good to go.

```bash
$ brew cask install virtualbox
# ==> Tapping homebrew/cask
# Cloning into '/usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask'...
# remote: Enumerating objects: 95, done.
# remote: Counting objects: 100% (95/95), done.
# remote: Compressing objects: 100% (69/69), done.
# remote: Total 436217 (delta 46), reused 45 (delta 26), pack-reused 436122
# Receiving objects: 100% (436217/436217), 196.20 MiB | 9.27 MiB/s, done.
# Resolving deltas: 100% (308765/308765), done.
# Tapped 1 command and 3544 casks (3,659 files, 210.6MB).
# ==> Caveats
# virtualbox requires a kernel extension to work.
# If the installation fails, retry after you enable it in:
#   System Preferences → Security & Privacy → General

# For more information, refer to vendor documentation or this Apple Technical Note:
#   https://developer.apple.com/library/content/technotes/tn2459/_index.html

# ==> Downloading https://download.virtualbox.org/virtualbox/6.1.6/VirtualBox-6.1.
# ######################################################################## 100.0%
# ==> Verifying SHA-256 checksum for Cask 'virtualbox'.
# ==> Installing Cask virtualbox
# ==> Running installer for virtualbox; your password may be necessary.
# ==> Package installers may write to any location; options such as --appdir are i
# Password:
# installer: Package name is Oracle VM VirtualBox
# installer: choices changes file '/var/folders/3p/wzkys03s6p1cvmn8yzm934400000gn/T/choices20200504-39760-ovdy9c.xml' applied
# installer: Installing at base path /
# installer: The install failed. (The Installer encountered an error that caused the installation to fail. Contact the # software manufacturer for assistance. An error occurred while running scripts from the package “VirtualBox.pkg”.)
# ==> Purging files for version 6.1.6,137129 of Cask virtualbox
# Error: Failure while executing; `/usr/bin/sudo -E -- /usr/bin/env LOGNAME=mjfrigaard USER=mjfrigaard USERNAME=mjfrigaard /usr/sbin/installer -pkg /usr/local/Caskroom/virtualbox/6.1.6,137129/VirtualBox.pkg -target / -applyChoiceChangesXML /var/folders/3p/wzkys03s6p1cvmn8yzm934400000gn/T/choices20200504-39760-ovdy9c.xml` exited with 1. Here's the output:
# installer: Package name is Oracle VM VirtualBox
# installer: choices changes file '/var/folders/3p/wzkys03s6p1cvmn8yzm934400000gn/T/choices20200504-39760-ovdy9c.xml' applied
# installer: Installing at base path /
# installer: The install failed. (The Installer encountered an error that caused the installation to fail. Contact the software manufacturer for assistance. An error occurred while running scripts from the package “VirtualBox.pkg”.)
# Follow the instructions here:
#   https://github.com/Homebrew/homebrew-cask#reporting-bugs
# /usr/local/Homebrew/Library/Homebrew/system_command.rb:176:in `assert_success!'
# /usr/local/Homebrew/Library/Homebrew/system_command.rb:53:in `run!'
# /usr/local/Homebrew/Library/Homebrew/system_command.rb:29:in `run'
# /usr/local/Homebrew/Library/Homebrew/system_command.rb:33:in `run!'
# /usr/local/Homebrew/Library/Homebrew/cask/artifact/pkg.rb:59:in `block in run_installer'
# /usr/local/Homebrew/Library/Homebrew/cask/artifact/pkg.rb:70:in `block in with_choices_file'
# /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/tempfile.rb:295:in `open'
# /usr/local/Homebrew/Library/Homebrew/cask/artifact/pkg.rb:67:in `with_choices_file'
# /usr/local/Homebrew/Library/Homebrew/cask/artifact/pkg.rb:52:in `run_installer'
# /usr/local/Homebrew/Library/Homebrew/cask/artifact/pkg.rb:34:in `install_phase'
# /usr/local/Homebrew/Library/Homebrew/cask/installer.rb:218:in `block in install_artifacts'
# /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/set.rb:777:in `each'
# /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/set.rb:777:in `each'
# /usr/local/Homebrew/Library/Homebrew/cask/installer.rb:209:in `install_artifacts'
# /usr/local/Homebrew/Library/Homebrew/cask/installer.rb:101:in `install'
# /usr/local/Homebrew/Library/Homebrew/cask/cmd/install.rb:22:in `block in run'
# /usr/local/Homebrew/Library/Homebrew/cask/cmd/install.rb:16:in `each'
# /usr/local/Homebrew/Library/Homebrew/cask/cmd/install.rb:16:in `run'
# /usr/local/Homebrew/Library/Homebrew/cask/cmd/abstract_command.rb:36:in `run'
# /usr/local/Homebrew/Library/Homebrew/cask/cmd.rb:150:in `run'
# /usr/local/Homebrew/Library/Homebrew/cask/cmd.rb:92:in `run'
# /usr/local/Homebrew/Library/Homebrew/cmd/cask.rb:9:in `cask'
# /usr/local/Homebrew/Library/Homebrew/brew.rb:110:in `<main>'
```

Attempt #2 for installing `virtualbox` with homebrew.

```bash
$ brew cask install virtualbox
# ==> Caveats
# virtualbox requires a kernel extension to work.
# If the installation fails, retry after you enable it in:
#   System Preferences → Security & Privacy → General

# For more information, refer to vendor documentation or this Apple Technical Note:
#   https://developer.apple.com/library/content/technotes/tn2459/_index.html

# ==> Downloading https://download.virtualbox.org/virtualbox/6.1.6/VirtualBox-6.1.6-137129-OSX.dmg
# Already downloaded: /Users/mjfrigaard/Library/Caches/Homebrew/downloads/dd236a1984d218adb4d454be08451822ced494f01af16831be17c27c8b6dec64--VirtualBox-6.1.6-137129-OSX.dmg
# ==> Verifying SHA-256 checksum for Cask 'virtualbox'.
# ==> Installing Cask virtualbox
# ==> Running installer for virtualbox; your password may be necessary.
# ==> Package installers may write to any location; options such as --appdir are ignored.
# installer: Package name is Oracle VM VirtualBox
# installer: choices changes file '/var/folders/3p/wzkys03s6p1cvmn8yzm934400000gn/T/choices20200504-40881-11svu4y.xml' applied
# installer: Installing at base path /
# installer: The install was successful.
# ==> Changing ownership of paths required by virtualbox; your password may be necessary
# 🍺  virtualbox was successfully installed!
```

Now that we’ve installed `docker` and `virtualbox` 

Now we’re good to go! The first task in the Katacoda scenario is to *first task is to identify the name of the Docker Image which is configured to run *Redis**

### Performing searches for containers in Docker

To search in Docker, we can use the following commands: `docker search <name of container>`

```bash
$ docker search redis
```

```
NAME                             DESCRIPTION                                     STARS               OFFICIAL            AUTOMATED
redis                            Redis is an open source key-value store that…   8114                [OK]
bitnami/redis                    Bitnami Redis Docker Image                      144                                     [OK]
sameersbn/redis                                                                  79                                      [OK]
grokzen/redis-cluster            Redis cluster 3.0, 3.2, 4.0 & 5.0               67
rediscommander/redis-commander   Alpine image for redis-commander - Redis man…   38                                      [OK]
kubeguide/redis-master           redis-master with "Hello World!"                31
redislabs/redis                  Clustered in-memory database engine compatib…   24
oliver006/redis_exporter          Prometheus Exporter for Redis Metrics. Supp…   21
redislabs/redisearch             Redis With the RedisSearch module pre-loaded…   21
arm32v7/redis                    Redis is an open source key-value store that…   21
bitnami/redis-sentinel           Bitnami Docker Image for Redis Sentinel         13                                      [OK]
webhippie/redis                  Docker images for Redis                         11                                      [OK]
redislabs/redisgraph             A graph database module for Redis               11                                      [OK]
s7anley/redis-sentinel-docker    Redis Sentinel                                  10                                      [OK]
arm64v8/redis                    Redis is an open source key-value store that…   9
insready/redis-stat              Docker image for the real-time Redis monitor…   9                                       [OK]
redislabs/redismod               An automated build of redismod - latest Redi…   7                                       [OK]
redislabs/redisinsight           RedisInsight - The GUI for Redis                5
centos/redis-32-centos7          Redis in-memory data structure store, used a…   5
circleci/redis                   CircleCI images for Redis                       4                                       [OK]
clearlinux/redis                 Redis key-value data structure server with t…   2
tiredofit/redis                  Redis Server w/ Zabbix monitoring and S6 Ove…   1                                       [OK]
runnable/redis-stunnel           stunnel to redis provided by linking contain…   1                                       [OK]
wodby/redis                      Redis container image with orchestration        1                                       [OK]
xetamus/redis-resource           forked redis-resource                           0                                       [OK]
```

This shows all available containers that match this search string. This would not work on my machine at home, because I don’t have these installed. 

## **Step 1 - Running A Container**

> By default, Docker will run a command in the foreground. To run in the background, the option `-d` needs to be specified.  

```bash
# to run in the foreground
$ docker run <progrsm>
# to run in the background
$ docker run -d <program>
```


If we want to run the latest version of `redis`, we can use `redis:latest`

```bash
$ docker run redis:latest
```

But if we want to run this in the background, we have to use the `-d` option. 

```bash
$ docker run -d redis:latest
```

### **Step 2 - Finding Running Containers: Display all running docker containers**

In order to show what docker containers are currently running, we’ll use the `docker ps` 

> the `docker ps` command lists all running containers, the image used to start the container and uptime.  

Use it like this:

```bash
$ docker ps
# CONTAINER ID        IMAGE               COMMAND
# e942f55ec9d8        redis               "docker-entrypoint.s…"   
# CREATED             STATUS              PORTS   
# 16 minutes ago      Up 16 minutes       6379/tcp  
# NAMES
# xenodochial_chandrasekhar
```

As we can see, this returns the following information:

1. The container ID  `e942f55ec9d8`  
2. The image used  `redis`    
3. The command executed in the container `"docker-entrypoint.s…"`  
4. The time since the container was created  `16 minutes ago`   
5. The duration that the container has been running  `Up 16 minutes`   
6. The network ports exposed by the container  `6379/tcp`  
7. The name of the container  `xenodochial_chandrasekhar `  

### Inspecting and checking docker logs 

The `docker inspect <friendly-name|container-id>` gives us the data below in a JSON (see definition below). 

> The `docker inspect` command uses the names shown in the bottom half of each state (for example, `created`). The restarting, removing, and dead (not illustrated) states are internal to Docker and are used to track transitions between the states visible in `docker ps`   

```bash
# enter this to inspect the docker image
$ docker inspect 89d5ade15cb9
[
    {
        "Id": "89d5ade15cb92cee9022e74881329547cc40c102e5278f114eea05469899839c",
        "Created": "2020-05-05T07:00:25.142853938Z",
        "Path": "docker-entrypoint.sh",
        "Args": [
            "redis-server"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 1480,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2020-05-05T07:00:25.589820975Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:4e8db158f18dc71307f95260e532df39a9b604b51d4e697468e82845c50cfe28",
        "ResolvConfPath": "/var/lib/docker/containers/89d5ade15cb92cee9022e74881329547cc40c102e5278f114eea05469899839c/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/89d5ade15cb92cee9022e74881329547cc40c102e5278f114eea05469899839c/hostname",
        "HostsPath": "/var/lib/docker/containers/89d5ade15cb92cee9022e74881329547cc40c102e5278f114eea05469899839c/hosts",
        "LogPath": "/var/lib/docker/containers/89d5ade15cb92cee9022e74881329547cc40c102e5278f114eea05469899839c/89d5ade15cb92cee9022e74881329547cc40c102e5278f114eea05469899839c-json.log",
        "Name": "/jovial_kare",
        "RestartCount": 0,
        "Driver": "overlay",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "default",
            "PortBindings": {},
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "CapAdd": null,
            "CapDrop": null,
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "shareable",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "ConsoleSize": [
                0,
                0
            ],
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": null,
            "BlkioDeviceWriteBps": null,
            "BlkioDeviceReadIOps": null,
            "BlkioDeviceWriteIOps": null,
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DiskQuota": 0,
            "KernelMemory": 0,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": false,
            "PidsLimit": 0,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay/ad63d20004353b8c1a7effe3670956776f288ca2c063cf8c3c29cb5c653f37b2/root",
                "MergedDir": "/var/lib/docker/overlay/2c9a1122a463a94762cf1ec3b55097fd238d0c83606bfcb94b67f46986bf5cf3/merged",
                "UpperDir": "/var/lib/docker/overlay/2c9a1122a463a94762cf1ec3b55097fd238d0c83606bfcb94b67f46986bf5cf3/upper",
                "WorkDir": "/var/lib/docker/overlay/2c9a1122a463a94762cf1ec3b55097fd238d0c83606bfcb94b67f46986bf5cf3/work"
            },
            "Name": "overlay"
        },
        "Mounts": [
            {
                "Type": "volume",
                "Name": "f0aaa9ed5d399e0dfb6fffbef8d91a62088d4958908f647f222148427a97d55c",
                "Source": "/var/lib/docker/volumes/f0aaa9ed5d399e0dfb6fffbef8d91a62088d4958908f647f222148427a97d55c/_data",
                "Destination": "/data",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            }
        ],
        "Config": {
            "Hostname": "89d5ade15cb9",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "6379/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "GOSU_VERSION=1.10",
                "REDIS_VERSION=4.0.11",
                "REDIS_DOWNLOAD_URL=http://download.redis.io/releases/redis-4.0.11.tar.gz",
                "REDIS_DOWNLOAD_SHA=fc53e73ae7586bcdacb4b63875d1ff04f68c5474c1ddeda78f00e5ae2eed1bbb"
            ],
            "Cmd": [
                "redis-server"
            ],
            "ArgsEscaped": true,
            "Image": "redis",
            "Volumes": {
                "/data": {}
            },
            "WorkingDir": "/data",
            "Entrypoint": [
                "docker-entrypoint.sh"
            ],
            "OnBuild": null,
            "Labels": {}
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "cc943f7c736d2489990fcb56f53db64466b1fcfb684f2af5abc54af8aa39278f",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {
                "6379/tcp": null
            },
            "SandboxKey": "/var/run/docker/netns/cc943f7c736d",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "96bf90e5f58e8c0784d2376f67d83d7ce2f387e05355ebcc43f0007fab3279e5",
            "Gateway": "172.18.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.18.0.2",
            "IPPrefixLen": 24,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:12:00:02",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "72244dd9966c2535ab55673808300d45c6d1cebaac0785ea2e228369203e2ac1",
                    "EndpointID": "96bf90e5f58e8c0784d2376f67d83d7ce2f387e05355ebcc43f0007fab3279e5",
                    "Gateway": "172.18.0.1",
                    "IPAddress": "172.18.0.2",
                    "IPPrefixLen": 24,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:12:00:02",
                    "DriverOpts": null
                }
            }
        }
    }
]
```

To view the `docker logs`, we can use the the `docker logs <friendly-name|container-id>` or the following commands:

```bash
$ docker logs 89d5ade15cb9
1:C 05 May 07:00:25.583 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
1:C 05 May 07:00:25.583 # Redis version=4.0.11, bits=64, commit=00000000, modified=0, pid=1, just started
1:C 05 May 07:00:25.583 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
1:M 05 May 07:00:25.587 * Running mode=standalone, port=6379.
1:M 05 May 07:00:25.587 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
1:M 05 May 07:00:25.587 # Server initialized
1:M 05 May 07:00:25.587 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
1:M 05 May 07:00:25.587 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order toretain the setting after a reboot. Redis must be restarted after THP is disabled.
1:M 05 May 07:00:25.587 * Ready to accept connections
```

## **Step 3 - Accessing Redis**

Now that we’ve located the `redis` container, we need to access it. 

> Jane is happy that *Redis* is running, but is surprised that she cannot access it. The reason is that each container is sandboxed. If a service needs to be accessible by a process not running in a container, then the port needs to be exposed via the Host.  

#### Locating and viewing ports

In order to access a running program in docker, we need to know what port it is running on. Ports are exposed using the `docker logs <friendly-name|container-id>` 

> Once exposed, it is possible to access the process as if it were running on the host OS itself.  

Ports are typically four digits, and they are discovered using the `docker logs` command. 

### Ports and containers

> After reading the documentation, Jane discovers that ports are bound when containers are started using `-p <host-port>:<container-port>` option.   

So we can assign a name to a container using `docker run -p <host-port>:<container-port>`, and we also know how to get the `container-port` with the `docker logs` and `docker ls` commands.

```bash
docker run -d --name redisHostPort -p 6379:6379 redis:latest
```


#### Pro tip! 

> By default, the port on the host is mapped to `0.0.0.0`, which means all IP addresses. You can specify a particular IP address when you define the port mapping, for example, `-p 127.0.0.1:6379:6379`  


## **Step 4 - Accessing Redis**

When we run processes on a fixed port, we can only run a single instance:

> The problem with running processes on a fixed port is that you can only run one instance. Jane would prefer to run multiple *Redis* instances and configure the application depending on which port Redis is running on.  

What if we want to run more than one instance? Well, we can use the `p 6370` designation to 

> After experimenting, Jane discovers that just using the option `-p 6379` enables her to expose *Redis* but on a randomly available port  


```bash 
$ docker run -d --name redisDynamic -p 6379 redis:latest
```

### Name definitions when starting containers

> Jane also discovers that it’s useful to define a name when starting the container, this means she doesn’t have to use Bash piping or keep looking up the name when trying to access the logs. Jane finds the best way to solve her problem of running *Redis* in the background (`-d`), with a name (`--name`) of `redisHostPort` on port `6379` (this is doubled `6379:6379` is using the following command:  


```bash
# this runs the latest version of redis in the background on port 6379
# named redisHostPort 
$ docker run -d --name redisHostPort -p 6379:6379 redis:latest
```

This runs:

	- `docker run`
	- `-d` background option  
	- the name `--name` of the container `redisHostPost`
	- the port `6379`, which is listed twice (`6379:6379`)  
	- and finally, the latest version of redis with `redis:latest`

```bash
$ docker port redisDynamic 6379
```

We can check on the containers with the `docker ps` 

> After experimenting, Jane discovers that just using the option `-p 6379` enables her to expose *Redis* but on a randomly available port. She decides to test her theory using,  

```bash
CONTAINER ID        IMAGE               COMMAND                  CREATED
91aa7535a033        redis:latest        "docker-entrypoint.s…"   3 minutes ago
c5fe7035e579        redis:latest        "docker-entrypoint.s…"   23 minutes ago
a1c5e1c3914e        redis               "docker-entrypoint.s…"   38 minutes ago

STATUS              PORTS                     NAMES
Up 3 minutes        0.0.0.0:32768->6379/tcp   redisDynamic  
Up 23 minutes       0.0.0.0:6379->6379/tcp    redisHostPort  
Up 38 minutes       6379/tcp                  naughty_jang  
```

This shows the containers running, and we can see the two other named containers (`redisDynamic` and `redisHostPort`) we just created. Both of these are running on the same port, but with different ports. 

`redisDynamic` = `0.0.0.0:32768->6379/tcp`  
`redisHostPort` = `0.0.0.0:6379->6379/tcp`  
`naughty_jang` = `6379/tcp` 


## **Step 5 - Persisting Data**

The problem: 

> After working with containers for a few days, Jane realizes that the data stored keeps being removed when she deletes and re-creates a container. Jane needs the data to be persisted and reused when she recreates a container.  

The solution: 

> Containers are designed to be stateless. Binding directories (also known as volumes) is done using the option `-v <host-dir>:<container-dir>`    
> When a directory is mounted, the files which exist in that directory on the host can be accessed by the container and any data changed/written to the directory inside the container will be stored on the host.   
> This allows you to upgrade or change containers without losing your data.  

Now we need data to persist across containers. We read some documentation on [Docker Hub](https://hub.docker.com/_/redis/) about Redis. 

```bash
# run redis in the background with this docker container named 
# redisMapped, with data in '/opt/docker/data/redis:/dat'
$ docker run -d --name redisMapped -v /opt/docker/data/redis:/data redis
```

## **Step 6 - Running A Container In The Foreground**

Now we’ve reached the final step! This one explores what is going on in the frontend while we’re running programs in the backend. 

> Jane has been working with Redis as a background process. Jane wonders how containers work with foreground processes, such as `ps` or `bash`  

Below are some examples of running containers in the foreground: 

```bash
# launch Ubuntu container and executes the command ps to 
# view all the processes running in a container.
$ docker run ubuntu ps
#  PID TTY          TIME CMD
#    1 ?        00:00:00 ps

# get access to a bash shell inside of a container
$ docker run -it ubuntu bash
root@c797449ec229:/# bash --version
# GNU bash, version 4.3.48(1)-release (x86_64-pc-linux-gnu)
# Copyright (C) 2013 Free Software Foundation, Inc.
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

# This is free software; you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.
```














