var MyToken = artifacts.require("MyToken.sol");

module.exports = (deployer, network, accounts) => {
    deployer.then(async () => {
        await deployMyToken(deployer, network, accounts); 
        await deployRecap(deployer, network, accounts)
    });
};

async function deployMyToken(deployer, network, accounts) {
	MyToken = await MyToken.new()
}

async function deployRecap(deployer, network, accounts) {
	console.log("MyToken " + MyToken.address)
}