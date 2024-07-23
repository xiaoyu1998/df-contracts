import { sendTxn, getContractAddress, getToken, expandDecimals, contractAt} from "../utils/helper";

async function main() {
    const [owner, user] = await ethers.getSigners();

    const poolAddress = getContractAddress("Pool");
    const pool = await contractAt("Pool", poolAddress, owner);
 
    const usdtAddress = getToken("USDT")["address"];   
    const usdtDecimals = getToken("USDT")["decimals"];
    const usdt = await contractAt("MintableToken", usdtAddress);

    const balanceBeforeWithdraw = usdt.balanceOf(user.address);
    const shareTokenAddress = await pool.shareToken();
    const shareToken = await contractAt("ShareToken", shareTokenAddress);
    const shares = await shareToken.balanceOf(owner.address);
    await pool.withdraw(shares, user.address);
    const balanceAfterWithdraw = usdt.balanceOf(user.address);
    
    console.log("balanceBeforeWithdraw", balanceBeforeWithdraw);
    console.log("balanceAfterWithdraw", balanceAfterWithdraw);
    console.log("position", await pool.Positions(owner.address));
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error)
    process.exit(1)
  })