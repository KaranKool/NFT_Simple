const BridgeEth = artifacts.require('./BridgeEth.sol');

module.exports = async done => {
  const [recipient, _] = await web3.eth.getAccounts();
  console.log(recipient)
  const bridgeEth = await BridgeEth.deployed();
  console.log(bridgeEth)
  await bridgeEth.hold(recipient, 100);
  done();
}