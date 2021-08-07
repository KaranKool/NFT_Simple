const HDWalletProvider = require('@truffle/hdwallet-provider');
const mnemonic = 'relax where record inspire purchase kitten easy allow clever corn bonus cover';

module.exports = {
  networks: {
    ethTestnet: {
      provider: () => new HDWalletProvider(
        mnemonic, 
        'https://rinkeby.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161',
        0,
        1
      ),
      network_id: 4, //rinkeby
      skipDryRun: true
    },
    bscTestnet: {
      provider: () => new HDWalletProvider(
        mnemonic, 
        'https://data-seed-prebsc-1-s1.binance.org:8545'
      ),
      network_id: 97,
      skipDryRun: true
    },
  },
  compilers: {
    solc: {
      version: "0.8.6",    // Fetch exact version from solc-bin (default: truffle's version)
    }
  }
};
