var HDWalletProvider = require("@truffle/hdwallet-provider");
const MNEMONIC = 'D04D30039ACFC2369D610F417C68A3321344550E93AA2CA58BD73F01D33813D5';

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    develop: {
      port: 8545
    },
	ropsten: {
      provider: function() {
        return new HDWalletProvider(MNEMONIC, "https://ropsten.infura.io/v3/9ea72b94008c44978f74dbb7e836e0d8")
      },
      network_id: 3,
      gas: 4000000      //make sure this gas allocation isn't over 4M, which is the max
    }
  }
};
