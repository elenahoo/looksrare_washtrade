<div align="center">
<a href="https://mail.google.com/mail/u/?authuser=elenahoo@gmail.com">
  <img align="center" alt="elenahoo | Gmail" width="30px" src="https://edent.github.io/SuperTinyIcons/images/svg/gmail.svg" />
	<code>elenahoo@gmail.com</code>
</a>
	<span> ┃ </span>
	
<a href="https://t.me/elenahoo">
  <img align="center" alt="elenahoo | Telegram" width="30px" src="https://edent.github.io/SuperTinyIcons/images/svg/telegram.svg" />
	<code>@elenahoo</code>
</a>
	<span>┃</span>
  <a href="" style="margin-top: 12px;">
  <img  align="center" alt="Discord" width="30px" src="https://raw.githubusercontent.com/peterthehan/peterthehan/master/assets/discord.svg" />
	  <code>E.Hu#6754</code>
</a>
	<span>┃</span>
  <a href="" style="margin-top: 12px;">
  <img  align="center" alt="elenahoo | Twitter" width="30px" src="https://raw.githubusercontent.com/peterthehan/peterthehan/master/assets/twitter.svg" />
	  <code>@hoolupoodalz</code>
</a>
<br />

</div>
	
<div align="center">
  <strong>For questions, discussions and freelance work, please feel free to reach out! </strong>
</div>
<br />

# LooksRare wash trade simulation

This code shows how the LooksRare wash trade simulation is done as described in my article [here](https://elenahoo.medium.com/looksrare-washing-trading-reward-simulation-fea6272bf89a) by changing one of the three moving components:
- u: Individual trader’s volume in $ETH
- v: Total daily volume in $ETH
- e/l: $ETH/$LOOKS exchange rate, where e is Ether’s price in USD and l is LOOKS price in USD

For explanation of what wash trade is and the analytical metrics including the daily trade volume, top 10 wash traders, see my CoinTelegraph artilce [here](https://cointelegraph.com/news/clever-nft-traders-exploit-crypto-s-unregulated-landscape-by-wash-trading-on-looksrare) and my Dune Analytics dashboarde [here](https://dune.xyz/elenahoo/LooksRare-Wash-Trading).

## Total daily volume simulation
<img width="696" alt="image" src="https://user-images.githubusercontent.com/36990254/152775452-3953adff-77bf-4bf6-b9f9-342b9436eaf6.png">


## $ETH/$LOOKS exchange rate simulation
<img width="690" alt="image" src="https://user-images.githubusercontent.com/36990254/152775640-e322d2af-616c-49a5-97aa-d1ef589bb00e.png">

## Trader's volume simulation
<img width="697" alt="image" src="https://user-images.githubusercontent.com/36990254/152775693-84c3480d-ee21-4236-96f1-53ed6d3e1b8d.png">
