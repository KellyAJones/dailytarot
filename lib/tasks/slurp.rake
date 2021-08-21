namespace :slurp do
  desc "TODO"
  task TarotCard: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "Tarot_Database.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = TarotCard.new
      t.id = row["id"]
      t.arcana = row["arcana"]
      t.description = row["description"]
      t.image = row["image"]
      t.name = row["name"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
      puts "#{t.name} saved"
    end 

    puts "There are now #{TarotCard.count} rows in the Tarot Card table."
  end

end
