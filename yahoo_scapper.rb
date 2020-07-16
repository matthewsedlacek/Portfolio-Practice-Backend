require 'open-uri'
require 'nokogiri'
require 'pry'

# needed element = '<span class="Trsdu(0.3s) Fw(b) Fz(36px) Mb(-4px) D(ib)" data-reactid="50">3,084.00</span>'


#Tested
input = 'AMZN'

#Costco 
cost = Nokogiri::HTML(open("https://finance.yahoo.com/quote/#{input}"))
binding.pry
# Stock Price
cost.css('#quote-header-info').css("span").children[1].inner_text
# Stock Time 
cost.css('#quote-market-notice').inner_text
# Stock Change
cost.css('#quote-header-info').css("span").children[2].inner_text
# Daily High / Low
cost.css('#quote-summary').css("tr").children[9].inner_text
# 52 week High / Low
cost.css('#quote-summary').css("tr").children[11].inner_text
# Company Name
cost.css('#quote-header-info').css("h1").inner_text

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
