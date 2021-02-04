# HyperShell Node.js Ubuntu container
This container implements a demo application illustrating how to provision Docker-based micro-services with the HyperShell agent.

## How to start your agent
The Node.js demo application listening on port 3000 can be started with:
```shell
docker run -dit -p 3000:3000 --restart always --name hysh-docker-node -e "CHAINCODE_ID_NAME=8b554abeb1144726ab3167f67bdfba36" vitche/hysh-docker-node
```
The agent identifier is specified using the "CHAINCODE_ID_NAME" environment variable.