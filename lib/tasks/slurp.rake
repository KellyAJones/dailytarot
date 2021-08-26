namespace :slurp do
  desc "TODO"
  task TarotCard: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "Tarot_Database.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      # puts row.to_hash
       t = TarotCard.new
       t.arcana = row["Arcana"]
       t.description = row["Description"]
       t.image = row["Image"]
       t.name = row["Name"]
      t.save
       puts "#{t.name} saved"
    end 

    puts "There are now #{TarotCard.count} rows in the Tarot Card table."
  end

end
