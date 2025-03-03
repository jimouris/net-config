<h1 align="center">Net Config
  <a href="https://github.com/jimouris/net-config/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</h1>


A simple command-line tool to configure network latency and bandwidth limits on the local loopback interface for testing and development purposes.

## Features

- Add configurable latency to the loopback interface
- Set bandwidth limits (optional)
- View current network configuration status
- Easily disable all network modifications
- Simple command-line interface

## Requirements

- Linux/Unix-like operating system
- `sudo` privileges (for modifying network settings)
- `tc` (traffic control) command-line tool

## Usage

The tool provides three main commands:

### View Current Status
```shell
./net-config.sh status
```
This will show the current queue discipline and class settings on the loopback interface.

### Add Latency and/or Bandwidth Limit
```shell
./net-config.sh on <latency_ms> [max_mbps]
```
- `latency_ms`: Required. The latency to add in milliseconds
- `max_mbps`: Optional. Maximum bandwidth limit in Mbps

Examples:
```shell
# Add 100ms latency
./net-config.sh on 100

# Add 1ms latency and limit bandwidth to 1 Gbps
./net-config.sh on 1 1000

# Add 50ms latency and limit bandwidth to 10 Gbps
./net-config.sh on 50 10000
```

### Remove Network Modifications
```shell
./net-config.sh off
```
This will remove all network modifications and restore the default settings.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
