const main = async () => {
	const commentContractFactory = await hre.ethers.getContractFactory('commentRegister');
	const commentContract = await commentContractFactory.deploy();
	await commentContract.deployed();
	console.log("contract Address:", commentContract.address);
	
	const commentTxn = await commentContract.register("hello world");
	await commentTxn.wait();
	
	let allComments = await commentContract.getAllComments();
	console.log(allComments);
}

const runMain = async () => {
	try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();