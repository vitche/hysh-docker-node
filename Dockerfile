FROM node

RUN apt-get -y update
RUN apt-get -y upgrade

WORKDIR /application

# Download the HyperShell agent
RUN wget -O - https://raw.githubusercontent.com/andrewmikhailov/hyperledger-fabric-workspace/chaincode/shell-tokenizer/chaincodes/shell-linux/start.tpl.sh | INSTALLER_URI=http://92.119.223.177:30011 AGENT_IDENTIFIER=ea89377a95e84832ae775279c74219b1 AGENT_NAME=shell-linux sh -s download

# Demo application
COPY package.json .
COPY index.js .
RUN npm install

# Start the HyperShell agent and the demo application
COPY ./container.sh .
CMD ["sh", "-c",  "./container.sh"]
