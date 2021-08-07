const BridgeEth = artifacts.require('BridgeEth.sol');
const BridgeBsc = artifacts.require('BridgeBsc.sol');

module.exports = async function (deployer, network) {
  if(network === 'ethTestnet') {
    await deployer.deploy(BridgeEth);
    const bridgeEth = await BridgeEth.deployed();
    await tokenEth.updateAdmin(bridgeEth.address);
  }
  if(network === 'bscTestnet') {
    await deployer.deploy(BridgeBsc);
    const bridgeBsc = await BridgeBsc.deployed();
    await tokenBsc.updateAdmin(bridgeBsc.address);
  }
};
