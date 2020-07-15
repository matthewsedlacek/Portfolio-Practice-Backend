require 'open-uri'
require 'nokogiri'

# needed element = '<span class="Trsdu(0.3s) Fw(b) Fz(36px) Mb(-4px) D(ib)" data-reactid="50">3,084.00</span>'


#Amazon
amzn = Nokogiri::HTML(open("https://finance.yahoo.com/quote/AMZN"))
puts amzn.css(("span[data-reactid='14']"))

#Microsoft
msft = Nokogiri::HTML(open("https://finance.yahoo.com/quote/MSFT"))
puts msft.css(("span[data-reactid='14']"))



# puts doc.css("span")

# ("#Trsdu(0.3s) Trsdu(0.3s) Fw(b) Fz(36px) Mb(-4px) D(b)")


# .css("data-reactid='50'")
# puts doc.css("span[data-reactid='50']")
