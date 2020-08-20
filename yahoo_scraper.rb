require 'open-uri'
require 'nokogiri'
require 'pry'

# Web Scraper used in previous verisions of Portfolio Practice App

def stock_tickers
    [ 'MMM','ABT','ABBV','ABMD','ACN','ATVI','ADBE','AMD','AAP','AES','AFL','A','APD','AKAM','ALK','ALB','ARE','ALXN','ALGN','ALLE','LNT','ALL','GOOGL','GOOG','MO','AMZN','AMCR','AEE','AAL','AEP','AXP','AIG','AMT','AWK','AMP','ABC','AME','AMGN','APH','ADI','ANSS','ANTM','AON','AOS','APA','AIV','AAPL','AMAT','APTV','ADM','ANET','AJG','AIZ','T','ATO','ADSK','ADP']
end

def stock_scrapper
    url = "https://finance.yahoo.com/quote/"
    array = []
    stock_tickers.each_with_index {|stock, index|
        sleep 1
        url = url.concat(stock)
        if cost = Nokogiri::HTML(open(url))
            cost = Nokogiri::HTML(open(url))
        else
            cost = "not found"
            url = "https://finance.yahoo.com/quote/"
        end

        if stock_price = cost.css('#quote-header-info').css("span").children[1]
            stock_price = cost.css('#quote-header-info').css("span").children[1].inner_text
            if stock_price.include?(",")
                updated_stock = stock_price.gsub(/[^\d^.]/, '').to_f
              else 
                updated_stock = stock_price.to_f
              end
        else 
            updated_stock = "not found"
            url = "https://finance.yahoo.com/quote/"
        end

        if stock_time = cost.css('#quote-market-notice').inner_text 
            stock_time = cost.css('#quote-market-notice').inner_text
        else 
            stock_time = "not found"
            url = "https://finance.yahoo.com/quote/"
        end

        if stock_change = cost.css('#quote-header-info').css("span").children[2]
            stock_change = cost.css('#quote-header-info').css("span").children[2].inner_text.split(" ")
        else 
            stock_change = "not found"
            url = "https://finance.yahoo.com/quote/"
        end

        if dollar_change = stock_change[0] 
            dollar_change = stock_change[0]
        else 
            dollar_change = "not found"
            url = "https://finance.yahoo.com/quote/"
        end

        if percent_change = stock_change[1] 
            percent_change = stock_change[1]
        else
            percent_change = "not found"
            url = "https://finance.yahoo.com/quote/"
        end

        if daily = cost.css('#quote-summary').css("tr").children[9] 
            daily = cost.css('#quote-summary').css("tr").children[9].inner_text.split(" ")
        else 
            daily = "not found"
            url = "https://finance.yahoo.com/quote/"
        end

        if daily_low = daily[0] 
            daily_low = daily[0]
        else
            daily_low = "not found"
            url = "https://finance.yahoo.com/quote/"
        end

        if daily_high = daily[2] 
            daily_high = daily[2]
        else
            daily_high = "not found"
            url = "https://finance.yahoo.com/quote/"
        end

        if fifty_two = cost.css('#quote-summary').css("tr").children[11] 
            fifty_two = cost.css('#quote-summary').css("tr").children[11].inner_text.split(" ")
        else
            fifty_two = "not found"
            url = "https://finance.yahoo.com/quote/"
        end

        if fifty_two_low = fifty_two[0] 
            fifty_two_low = fifty_two[0]
        else
            fifty_two_low = "not found"
            url = "https://finance.yahoo.com/quote/"
        end

        if fifty_two_high = fifty_two[2] 
            fifty_two_high = fifty_two[2]
        else
            fifty_two_high = "not found"
            url = "https://finance.yahoo.com/quote/"
        end

        StockPrice.create(company_id: index + 1, current_price: updated_stock, dollar_change: dollar_change, percent_change: percent_change, as_of_time: stock_time, daily_high: daily_high, daily_low: daily_low, fifty_two_week_high: fifty_two_high, fifty_two_week_low: fifty_two_low, transacted: false)
        url = "https://finance.yahoo.com/quote/"
    }
  end
