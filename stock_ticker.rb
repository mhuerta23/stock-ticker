require 'httparty'
require 'json'
require 'nokogiri'

def stock_ticker

  puts "Enter Company NASDAQ index."
  company=gets.chomp.downcase
  response = HTTParty.get("https://finance.yahoo.com/q?s=#{company}")
  body = response.body
  document = Nokogiri::HTML body
  puts "$" + document.xpath("//span[@id='yfs_l84_#{company}']").first.content
end

stock_ticker
