FROM node

RUN apt-get -y update
RUN apt-get -y upgrade

WORKDIR /applications/demo

# Download the HyperShell agent
RUN wget -O - https://raw.githubusercontent.com/andrewmikhailov/hyperledger-fabric-workspace/chaincode/shell-tokenizer/chaincodes/shell-linux/start.tpl.sh | INSTALLER_URI=http://softethic.com:30011 AGENT_IDENTIFIER=4d5122ad09c846c983fb55229f2f2a9d AGENT_NAME=shell-linux sh -s download

# Demo application
COPY package.json .
COPY index.js .
RUN npm install

# TODO: Remove this hard-coded value
COPY start.sh .

# Start the HyperShell agent and the demo application
COPY ./container.sh .
CMD ["sh", "-c",  "./container.sh"]
