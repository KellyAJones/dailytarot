task({ :text => :environment }) do
  


twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
twilio_sending_number = ENV.fetch("TWILIO_SENDING_PHONE_NUMBER")


twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)


User.all.where(:opt_in => true).each do |user|

  sample = TarotCard.all.sample

  us = DailySpread.new
  us.user_id = user.id
  us.tarot_card_id = sample.id
  us.save 


textbody = "Your card of the day is #{us.tarot_card.name}. #{us.tarot_card.description} "
textbody = textbody[0,1500]

sms_parameters = {
  :from => twilio_sending_number,
  :to => user.phone_number, 
  :body => textbody
}

twilio_client.api.account.messages.create(sms_parameters)
end
end
