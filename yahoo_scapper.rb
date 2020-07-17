require 'open-uri'
require 'nokogiri'
require 'pry'

# def stock_tickers 
#     [ 'MMM','ABT','ABBV','ABMD','ACN','ATVI','ADBE','AMD','AAP','AES','AFL','A','APD','AKAM','ALK','ALB','ARE','ALXN','ALGN','ALLE','LNT','ALL','GOOGL','GOOG','MO','AMZN','AMCR','AEE','AAL','AEP','AXP','AIG','AMT','AWK','AMP','ABC','AME','AMGN','APH','ADI','ANSS','ANTM','AON','AOS','APA','AIV','AAPL','AMAT','APTV','ADM','ANET','AJG','AIZ','T','ATO','ADSK','ADP','AZO','AVB','AVY','BKR','BLL','BAC','BK','BAX','BDX','BRK.B','BBY','BIIB','BIO','BLK','BA','BKNG','BWA','BXP','BSX','BMY','AVGO','BR','BF.B','CHRW','COG','CDNS','CPB','COF','CAH','KMX','CCL','CARR','CAT','CBOE','CBRE','CDW','CE','CNC','CNP','CTL','CERN','CF','SCHW','CHTR','CVX','CMG', 'CB','CHD','CI','CINF','CTAS','CSCO','C','CFG','CTXS','CLX','CME','CMS','KO','CTSH','CL', 'CMCSA','CMA','CAG','CXO','COP','ED','STZ','COO','CPRT','GLW','CTVA','COST','COTY','CCI','CSX','CMI','CVS','DHI','DHR','DRI','DVA','DE','DAL','XRAY','DVN','DXCM','FANG','DLR','DFS','DISCA','DISCK','DISH','DG','DLTR','D','DPZ','DOV','DOW','DTE','DUK','DRE','DD','DXC','ETFC','EMN','ETN','EBAY','ECL','EIX','EW','EA','EMR','ETR','EOG','EFX','EQIX','EQR','ESS','EL','EVRG','ES','RE','EXC','EXPE','EXPD','EXR','XOM','FFIV','FB','FAST','FRT','FDX','FIS','FITB','FE','FRC','FISV','FLT','FLIR','FLS','FMC','F','FTNT','FTV','FBHS','FOXA','FOX','BEN','FCX','GPS','GRMN','IT','GD','GE','GIS','GM','GPC','GILD','GL','GPN','GS','GWW','HRB','HAL','HBI','HIG','HAS','HCA','PEAK','HSIC','HSY','HES','HPE','HLT','HFC','HOLX','HD','HON','HRL','HST','HWM','HPQ','HUM','HBAN','HII','IEX','IDXX','INFO','ITW','ILMN','INCY','IR','INTC','ICE','IBM','IP','IPG','IFF','INTU','ISRG','IVZ','IPGP','IQV','IRM','JKHY','J','JBHT','SJM','JNJ','JCI','JPM','JNPR','KSU','K','KEY','KEYS','KMB','KIM','KMI','KLAC','KSS','KHC','KR','LB','LHX','LH','LRCX','LW','LVS','LEG','LDOS','LEN','LLY','LNC','LIN','LYV','LKQ','LMT','L','LOW','LYB','MTB','MRO','MPC','MKTX','MAR','MMC','MLM','MAS','MA','MKC','MXIM','MCD','MCK','MDT','MRK','MET','MTD','MGM','MCHP','MU','MSFT','MAA','MHK','TAP','MDLZ','MNST','MCO','MS','MOS','MSI','MSCI','MYL','NDAQ','NOV','NTAP','NFLX','NWL','NEM','NWSA','NWS','NEE','NLSN','NKE','NI','NBL','NSC','NTRS','NOC','NLOK','NCLH','NRG','NUE','NVDA','NVR','ORLY','OXY','ODFL','OMC','OKE','ORCL','OTIS','PCAR','PKG','PH','PAYX','PAYC','PYPL','PNR','PBCT','PEP','PKI','PRGO','PFE','PM','PSX','PNW','PXD','PNC','PPG','PPL','PFG','PG','PGR','PLD','PRU','PEG','PSA','PHM','PVH','QRVO','PWR','QCOM','DGX','RL','RJF','RTX','O','REG','REGN','RF','RSG','RMD','RHI','ROK','ROL','ROP','ROST','RCL','SPGI','CRM','SBAC','SLB','STX','SEE','SRE','NOW','SHW','SPG','SWKS','SLG','SNA','SO','LUV','SWK','SBUX','STT','STE','SYK','SIVB','SYF','SNPS','SYY','TMUS','TROW','TTWO','TPR','TGT','TEL','FTI','TFX','TXN','TXT','TMO','TIF','TJX','TSCO','TT','TDG','TDY','TRV','TFC','TWTR','TSN','TYL','UDR','ULTA','USB','UAA','UA','UNP','UAL','UNH','UPS','URI','UHS','UNM','VFC','VLO','VAR','VTR','VRSN','VRSK','VZ','VRTX','VIAC','V','VNO','VMC','WRB','WAB','WMT','WBA','DIS','WM', 'WAT','WEC','WFC','WELL','WST','WDC','WU','WRK','WY','WHR','WMB','WLTW','WYNN','XEL','XRX','XLNX','XYL','YUM','ZBRA','ZBH','ZION','ZTS']
# end

def stock_tickers
    ['MMM','ABT','ABBV']

end

def stock_scrapper
    url = "https://finance.yahoo.com/quote/"
    stock_tickers.each_with_index {|stock, index|
        url = url.concat(stock)
        cost = Nokogiri::HTML(open(url))
        stock_price = cost.css('#quote-header-info').css("span").children[1].inner_text
        stock_time = cost.css('#quote-market-notice').inner_text
        stock_change = cost.css('#quote-header-info').css("span").children[2].inner_text
        daily_high_low = cost.css('#quote-summary').css("tr").children[9].inner_text
        fifty_two_high_low = cost.css('#quote-summary').css("tr").children[11].inner_text
    StockPrice.create(company_id: index + 1, current_price: stock_price, dollar_change: stock_change, percent_change: stock_change, as_of_time: stock_time, daily_high: daily_high_low, daily_low: daily_high_low, fifty_two_week_high: fifty_two_high_low, fifty_two_week_low: fifty_two_high_low, transacted: false)
    }
  end

stock_scrapper

#Tested
# input = 'AMZN'

#Costco 
# cost = Nokogiri::HTML(open("https://finance.yahoo.com/quote/#{input}"))
# binding.pry
# Stock Price
# cost.css('#quote-header-info').css("span").children[1].inner_text
# Stock Time 
# cost.css('#quote-market-notice').inner_text
# Stock Change
# cost.css('#quote-header-info').css("span").children[2].inner_text
# Daily High / Low
# cost.css('#quote-summary').css("tr").children[9].inner_text
# 52 week High / Low
# cost.css('#quote-summary').css("tr").children[11].inner_text
# Company Name
# cost.css('#quote-header-info').css("h1").inner_text


# #Amazon
# amzn = Nokogiri::HTML(open("https://finance.yahoo.com/quote/AMZN"))
# binding.pry
# # Stock Price
# amzn.css('#quote-header-info').css("span").children[1].inner_text
# # Stock Time 
# amzn.css('#quote-market-notice').inner_text
# # Stock Change
# amzn.css('#quote-header-info').css("span").children[2].inner_text

# #Microsoft
# msft = Nokogiri::HTML(open("https://finance.yahoo.com/quote/MSFT"))
# binding.pry
# # Stock Price
# msft.css('#quote-header-info').css("span").children[1].inner_text
# # Stock Time 
# msft.css('#quote-market-notice').inner_text
# # Stock Change
# msft.css('#quote-header-info').css("span").children[2].inner_text






# Old

# puts msft.css(("span[data-reactid='14']")).children[0].inner_text
# puts msft.css('#quote-market-notice').first.parent.css("span").first.parent.inner_text
# ## $ change and % Change
# msft.css('#quote-market-notice').first.parent.css("span").first.inner_text

#Amazon
# amzn = Nokogiri::HTML(open("https://finance.yahoo.com/quote/AMZN"))
# puts amzn.css(("span[data-reactid='14']"))


# puts doc.css("span")

# ("#Trsdu(0.3s) Trsdu(0.3s) Fw(b) Fz(36px) Mb(-4px) D(b)")


# .css("data-reactid='50'")
# puts doc.css("span[data-reactid='50']")
