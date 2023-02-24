var ExerciceSolution = artifacts.require("ExerciceSolution.sol");

module.exports = (deployer, network, accounts) => {
    deployer.then(async () => {
        await deployExerciceSolution(deployer, network, accounts); 
        await deployRecap(deployer, network, accounts)
    });
};

async function deployExerciceSolution(deployer, network, accounts) {
	ExerciceSolution = await ExerciceSolution.new("0x1d597f6a4fB74F9Ef8234397e4640Bac2c3B7518")
}

async function deployRecap(deployer, network, accounts) {
	console.log("ExerciceSolution " + ExerciceSolution.address)
}