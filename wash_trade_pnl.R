
#########################
## Constant parameter ##
#########################
fee = 0.02

###############
## Functions ##
###############

pnl_v <- function(eth, looks, r_looks, xu, xl, yu, yl, x, y, title){
  ## Fixed ETH/LOOKS (user input)
  ## Simulate total daily trade volume
  ## Compare PnL for different fixed trader volumes 

  vol = seq(100*1e6, 2000*1e6, 1*1e6)/eth
  ethlooks = eth/looks
  r_eth =  r_looks / ethlooks
  
  buy = c(10, 5, 1) ## in eth
  color = c('black', 'green', 'blue')
  
  for (i in 1:length(buy)){
    profit = (buy[i]/vol)*r_eth-fee*buy[i]/2
    if (buy[i] == buy[1]){
      plot(vol, profit, type = 'l', xlim = c(xl, xu), ylim = c(yl, yu), xlab = "Daily volume ($ETH)", ylab = "Trader profit ($ETH)", main = title)
    } else {
      lines(vol, profit, col = color[i])
    }
  }
  be = max(vol[which(profit>0)])
  abline(v = be, col="red", lwd=2, lty=2)
  #text("Break-even volume", x = be, y = max(profit), srt = -90, pos = 2)
  text(paste0(round(be), " ETH"), x = be, y = min(profit), srt = 90, adj = c(x, y))
  
  legend("topright", legend=c("Trade 10 ETH", "Trade 5 ETH", "Trade 1 ETH"),
         col = color, lty = 1:1, cex=0.8)
  
}


pnl_el <- function(trader_vol, r_looks, xu, xl, yu, yl, title){
  ## Fixed trader volume (user input)
  ## Simulate ETH/LOOKS
  ## Compare PnL for different fixed total daily trade volume
  eth = seq(2000, 4000, 50)
  looks = seq(2.5, 6.5, 0.1)
  ethlooks = eth/looks
  r_eth =  r_looks / ethlooks
  
  buy = trader_vol
  vol = c(200000, 250000, 300000) ## in eth
  
  color = c('black', 'green', 'blue')
  
  for (i in 1:length(vol)){
    profit = (buy/vol[i])*r_eth-fee*buy/2
    if (vol[i] == vol[1]){
      plot(ethlooks, profit, type = 'l', xlim = c(xl, xu), ylim = c(yl, yu), xlab = "$ETH/$LOOKS", ylab = "Trader profit ($ETH)", main = title)
    } else {
      lines(ethlooks, profit, col = color[i])
    }
  }
  
  legend("topright", legend=c("Total volume=200k ETH", "Total volume=250k ETH", "Total volume=300k ETH"),
         col = color, lty = 1:1, cex=0.8)
  
}


pnl_u <- function(vol, eth, r_looks, xu, xl, yu, yl, title, legend_pos){
  ## Fixed total daily volume in eth (user input)
  ## Fixed ether price (user input)
  ## Simulate trader volume %
  ## Compare PnL for different fixed $LOOKS
  trader_pct = seq(0, 1, 0.01)
  
  ## Changing $LOOKS price
  looks = c(5, 4.5, 4, 3.5, 3, 2.5)
  ethlooks = eth/looks
  r_eth =  r_looks / ethlooks
  color = c('black', 'green', 'blue', 'orange', 'red','purple')
  
  
  for (i in 1:length(looks)){
    profit = trader_pct*r_eth[i]-fee*trader_pct*vol/2
    
    if (looks[i] == looks[1]){
      plot(trader_pct*100, profit, xlim = c(xl, xu), ylim = c(yl, yu), type = 'l', main = title,
           xlab = paste0("% Trader volume / Total daily volume (=",vol, " ETH)"), ylab = paste0("Trader daily profit ($ETH) - $ETH=",eth))
    } else {
      lines(trader_pct*100, profit, col = color[i])
    }
    
    legend(legend_pos, legend=c("$LOOKS = $5", "$LOOKS = $4.5", "$LOOKS = $4", "$LOOKS = $3.5", "$LOOKS = $3", "$LOOKS = $2.5"),
           col = color, lty = 1:1, cex=0.8)
    
  }
}



pnl_l <- function(vol, eth, r_looks){
  ## Fixed total daily volume in eth (user input)
  ## Fixed ether price (user input)
  ## Simulate $LOOKS
  ## Compare PnL for different fixed trader volume %
  looks = seq(1.5, 5, 0.01)
  
  ethlooks = eth/looks
  r_eth =  r_looks / ethlooks
  
  ## Changing $LOOKS price
  trader_pct = c(0.01, 0.02, 0.03)
  color = c('black', 'green', 'blue')
  
  for (i in 1:length(trader_pct)){
    profit = trader_pct[i]*r_eth-fee*trader_pct[i]*vol/2
    
    if (trader_pct[i] == trader_pct[1]){
      plot(looks, profit, type = 'l', xlim = c(1,5), ylim = c(-50,60), xlab = paste0("$LOOKS price (ETH=",eth," volume=",vol,"ETH)"), ylab = "Trader daily profit ($ETH)")
    } else {
      lines(looks, profit, col = color[i])
    }
    be = min(looks[which(profit>0)])
    abline(v = be, col=color[i], lwd=1, lty=2)
    print(paste0("$LOOKS = ", be, " needed to break-even for trader percent ", trader_pct[i]))
    
    if (i==length(trader_pct)){
      text("Break-even price", x = be, y = max(profit), srt = -90, adj = c(-0.8, 1.5))
      text(paste0(" $LOOKS=",round(be,2)), x = be, y = min(profit), srt = 90, adj = c(-0.1, 1.5))
      
    }
    
  }
  legend("topleft", legend=c("Trade percent 1%", "Trade percent 2%", "Trade percent 3%"),
         col = color, lty = 1:1, cex=0.8)
}

#######################################
## Simulate daily trading volume (v) ##
#######################################
## Phase A
pnl_v(eth = 2500, looks = 4.2, r_looks = 2866500, xl=0.5e+05, xu=8e+05, yl=-0.1, yu=1.2, x=-1, y=1.5, "Phase A")

## Phase B
pnl_v(eth = 2500, looks = 4.2, r_looks = 1361587.5, xl=0.5e+05, xu=8e+05, yl=-0.1, yu=0.6, x=-1, y=1.5, "Phase B")

## Phase C
pnl_v(eth = 2500, looks = 4.2, r_looks = 537468.75, xl=0.5e+05, xu=8e+05, yl=-0.1, yu=0.4, x=-1, y=1.5, "Phase C")

## Phase D
pnl_v(eth = 2500, looks = 4.2, r_looks = 286650, xl=1e+04, xu=8e+05, yl=-0.1, yu=0.4, x=-1, y=1.5, "Phase D")

#######################################
## Simulate ETH/LOOKS exchange (e/l) ##
#######################################
## Phase A
pnl_el(trader_vol = 10, r_looks = 2866500, xl=600, xu=810, yl=0, yu=0.2, title = "Phase A")

## Phase B
pnl_el(trader_vol = 10, r_looks = 1361587.5, xl=600, xu=810, yl=-0.05, yu=0.05, title = "Phase B")

## Phase C
pnl_el(trader_vol = 10, r_looks = 537468.75, xl=600, xu=810, yl=-0.09, yu=-0.04, title = "Phase C")

## Phase D
pnl_el(trader_vol = 1, r_looks = 286650, xl=600, xu=810, yl=-0.01, yu=-0.006, title = "Phase D")

##############################
## Simulate Trader volume % ##
##############################
## Phase A
pnl_u(vol = 250000, eth = 2500, r_looks = 2866500, xl=0, xu=100, yl=-500, yu=3500, title = "Phase A", "topleft")

## Phase B
pnl_u(vol = 250000, eth = 2500, r_looks = 1361587.5, xl=0, xu=100, yl=-1500, yu=500, title = "Phase B", "bottomleft")

## Phase C
pnl_u(vol = 250000, eth = 2500, r_looks = 537468.75, xl=0, xu=100, yl=-2000, yu=0, title = "Phase C", "bottomleft")

## Phase D
pnl_u(vol = 250000, eth = 2500, r_looks = 286650, xl=0, xu=100, yl=-2200, yu=0, title = "Phase D", "bottomleft")

###########################
## Simulate $LOOKS price ##
###########################


pnl_l(vol = 340000, eth = 2500, r_looks = 2866500)


