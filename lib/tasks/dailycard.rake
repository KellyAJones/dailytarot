task({ :card => :environment }) do
  
  #TASK TO AUTO CREATE A DAILY CARD FOR EACH REGISTERED USER

  p "All daily cards count"
  p DailySpread.count

  need_text = DailySpread.where({ :sent => false })
  
  p "All texts count"
  p need_text.count



end