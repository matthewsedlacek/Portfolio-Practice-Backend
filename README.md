# Portfolio Practice - Backend

An application that provides users the ability to practice buying and selling S&P 500 stocks using live stock market data. This [link](https://github.com/matthewsedlacek/portfolio-practice-frontend) will direct you to the backend repository.

## Motivation

Portfolio Practice was created to be an educational tool for new investors and finance students. The application empowers new investors with a no risk opportunity to practice buying and selling stocks. To encourage user engagement users are rewarded with stock awards when they try new strategies and realize gains. The application also provides users with breaking news stories realted to the stock market.

## Installation

1. Fork this repository
2. Run `bundle install` in terminal
3. Enter `rails s` in your terminal to run locally
4. Run the frontend server - refer to [frontend](https://github.com/matthewsedlacek/portfolio-practice-frontend) repository

## Frontend Features

Users can:

Profile Page

- Add stocks to a personal watchlist
- View stock price and daily change of stocks in watchlist
- Add stocks to watchlist
- Delete stocks from watchlist
- View news stories related to the stock market
- View awards earned from trading

Portfolio Page

- Create a portoflio
- View portoflio transactions
- View gains and losses on their stock transactions
- View value, available cash, and buying power of their portfolios

Trading Page

- Buy stocks for specified portfolio
- Sell stocks for specified portfolio
- View company stock information

Coming Soon

- List of terms and equations useful for stock trading
- Graph showing users returns vs. S&P 500
- Preview of transaction before submit

## Backend Technology Used

- Rails as API
- PostgreSQL
- Bcrypt
- JSON Web Tokens
- Local Storage
- Active Model Serializers

Prior Versions

- Nokogiri
  Used to scrape stock market data from yahoo finance and save to database (see yahoo_scraper.rb, in this repo, for example).
- Cron Jobs
  Used in conjunction with Nokogiri to scrape yahoo finance data in 15 minute intervals during trading hours

## Special Thanks To

Finnhub.io

- Stock Market API

Stocknewsapi.com

- Stock Market News API

## Collaborators

Helen Johns

- UX/UI Designer

## Licensing

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
For a copy of the GNU General Public License along write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
