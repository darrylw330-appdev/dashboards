Class CurrrenciesController < ApplicationController
 def first_currency
  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")

  @array_of_symbols = @symbols_hash.keys

  render({ :template => "currency_templates/step_one.html.erb" })
 end

 def second_currency
  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")

  @array_of_symbols = @symbols_hash.keys

  @from_symbol = params.fetch("from_currency")

  rendedr({ :template => "currency_templates/step_two_html.erb" })
 end

 def conversion





  
  @from_symbol = params.fetch("from_currency")
  @to_currency = params.fetch("to_currency")

  @currency_conversion_url = open("https://api.exchangerate.host/convert?from=#(@from_symbol)&to=#(@to_currency)").read
  @parsed_currency_data = JSON.parse(@currency_conversion_url)



  @exchange_rate = @parsed_data.dig("info", "rate")
  render({ :template => "currency_templates/step_three.html.erb" })
 end
end
