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
    //console.log(await web3.eth.sign('0x7bd0c0ec0208c13b03649f7916874e59270e73c287dffa1c1c3991a0b5f76ed8',accounts[0]))
    const result1 = ExerciceSolution.getMessageHash();
    console.log(result1);
    // const result = ExerciceSolution.extractAddress('0x7bd0c0ec0208c13b03649f7916874e59270e73c287dffa1c1c3991a0b5f76ed8', '0xd41a66e68e5d06a8bc49609ecb6188b17a520a70aaa546745fb811f4284602971299dddcb3baea64a739d756e97d93164b1a1bd0516485c04d746e298b6c77001c');
    // console.log(result);
}

