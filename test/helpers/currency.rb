def convert_to_usd(amount_in_zar)
  exchange_rate = 0.072 # Example exchange rate: 1 ZAR = 0.072 USD
  converted_amount = amount_in_zar * exchange_rate
  converted_amount.round(2)
end
