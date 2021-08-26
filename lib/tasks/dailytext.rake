task({ :text => :environment }) do
  

# Retrieve your credentials from secure storage
twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
twilio_sending_number = ENV.fetch("TWILIO_SENDING_PHONE_NUMBER")

# Create an instance of the Twilio Client and authenticate with your API key
twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

# Query all users who want to receive text messages
# Loop on all these people and create daily sample for them, then send based on their credentials
  
count = 0
User.all.where(:opt_in => true).each do |user|
 if count < 1
  count = count + 1
 
  sample = TarotCard.all.sample

  us = DailySpread.new
  us.user_id = user.id
  us.tarot_card_id = sample.id
  us.save 


textbody = "Your card of the day is #{us.tarot_card.name}. #{us.tarot_card.description} "

# Craft your SMS as a Hash with three keys
sms_parameters = {
  :from => twilio_sending_number,
  :to => user.phone_number, # Put your own phone number here if you want to see it in action
  :body => textbody
}

# Send your SMS!
twilio_client.api.account.messages.create(sms_parameters)
end
end
end
end
