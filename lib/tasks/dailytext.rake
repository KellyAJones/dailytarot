task({ :text => :environment }) do
  
    #TASK TO SEND A TEXT OF THE DAILY CARD FOR EACH REGISTERED USER

  p "All daily cards count"
  p DailySpread.count

  need_text = DailySpread.where({ :sent => false })
  
  p "All texts count"
  p need_text.count

  #Tell to send at 8am each day

  #TEXT ALERT?

  #Send to User

  #tarot_card.name
  #tarot_card.description
  #tarot_card.image

  #SEND SMS to 

  # User.phone_number



end