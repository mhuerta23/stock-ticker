require 'sinatra'
require 'httparty'
require 'JSON'
require 'Nokogiri'

get '/' do
 stock = params['stock']
 response = HTTParty.get("https://finance.yahoo.com/q?s=#{stock}")
  body = response.body
  document = Nokogiri::HTML body
  "$" + document.xpath("//span[@id='yfs_l84_#{stock.downcase}']").first.content
end
