task({ :text => :environment }) do
  

# Retrieve your credentials from secure storage
twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
twilio_sending_number = ENV.fetch("TWILIO_SENDING_PHONE_NUMBER")

# Create an instance of the Twilio Client and authenticate with your API key
twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

# Craft your SMS as a Hash with three keys
sms_parameters = {
  :from => twilio_sending_number,
  :to => "+13124839251", # Put your own phone number here if you want to see it in action
  :body => "It's going to rain today — take an umbrella!"
}

# Send your SMS!
twilio_client.api.account.messages.create(sms_parameters)

end