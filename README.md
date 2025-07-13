# Miningcore.WebUI

A modern, responsive WebUI for MiningCore mining pool software.

## Features

- Clean, responsive design
- Real-time statistics and monitoring
- Easy deployment with Docker
- Supports multiple coins and algorithms
- Mobile-friendly interface

## Quick Start with Docker

The easiest way to deploy Miningcore.WebUI is using the pre-built Docker image:

```bash
docker run -d \
  --name miningcore-webui \
  -p 8080:80 \
  --network miningcore-net \
  -v $(pwd)/poolconfig:/usr/share/nginx/html/poolconfig \
  warlocksingh/miningcore.webui:latest
```

### Configuration

1. **Network Setup**: Ensure the container is on the same Docker network as your MiningCore instance (default: `miningcore-net`)

2. **API Configuration**: Create a `config.js` file in the `poolconfig` directory:
   ```javascript
   // Custom configuration for MiningCore WebUI
   var WebURL = window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + "/";
   var API = "http://miningcore:4000/api/";  // Use Docker service name
   var stratumAddress = window.location.hostname;
   ```

3. **Pool Configuration**: Configure your pools in `poolconfig/pools.json`

## Manual Installation

1. Clone this repository
2. Configure `js/miningcore.js` with your MiningCore API endpoint
3. Deploy to any web server

## Docker Compose Example

```yaml
version: '3'

services:
  webui:
    image: warlocksingh/miningcore.webui:latest
    container_name: miningcore-webui
    restart: always
    ports:
      - "8080:80"
    volumes:
      - ./poolconfig:/usr/share/nginx/html/poolconfig
    networks:
      - miningcore-net

networks:
  miningcore-net:
    external: true
```

## Building from Source

To build your own Docker image:

```bash
git clone https://github.com/btclinux/Miningcore.WebUI.git
cd Miningcore.WebUI
docker build -t yourusername/miningcore.webui:latest .
```

## Support

For support, please open an issue on GitHub or visit our community forum.

## License

This project is open source and available under the MIT License.
- add blockchain height (number)
- add current round variance  (in %)
- add pool fee (in %)
- add block maturity (number blocks)
- add payment frequency  (hours)
- add payment threshold


<b>Changes:</b></br>
Version 1.0  (1 jul 2019)
- simple and fast WebUI (html and javascript)
- one file website displays selected info block and hides the rest
- one modern colorfull look 


