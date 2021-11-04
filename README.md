# PTZOptics Scripts

## cgi-bin Commands

### Device Information

#### Network Configuration

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/param.cgi?get_network_conf"
```

#### Firmware Version

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/param.cgi?get_device_conf"
```

#### Video Settings

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/param.cgi?get_media_video"`
```

## Jump to Preset

### Home Preset

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&home"
```

### Preset #1

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&1"
```

### Preset #2

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&2"
```

### Preset #3

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&3"
```

### Preset #4

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&4"
```

### Preset #5

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&5"
```

### Preset #6

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&6"
```

### Preset #7

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&7"
```

### Preset #8

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&8"
```

### Preset #9

```shell
CAMERA_IP='192.168.1.2'
curl "http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&9"
```
