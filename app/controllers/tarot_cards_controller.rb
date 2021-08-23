class TarotCardsController < ApplicationController
  def index
    @tarot_cards = TarotCard.all

  

    render({ :template => "tarot_cards/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tarot_cards = TarotCard.where({ :id => the_id })

    @the_tarot_card = matching_tarot_cards.at(0)

    render({ :template => "tarot_cards/show.html.erb" })
  end

  def create
    the_tarot_card = TarotCard.new
    the_tarot_card.name = params.fetch("query_name")
    the_tarot_card.image = params.fetch("query_image")
    the_tarot_card.description = params.fetch("query_description")
    the_tarot_card.arcana = params.fetch("query_arcana")

    if the_tarot_card.valid?
      the_tarot_card.save
      redirect_to("/tarot_cards", { :notice => "Tarot card created successfully." })
    else
      redirect_to("/tarot_cards", { :notice => "Tarot card failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_tarot_card = TarotCard.where({ :id => the_id }).at(0)

    the_tarot_card.name = params.fetch("query_name")
    the_tarot_card.image = params.fetch("query_image")
    the_tarot_card.description = params.fetch("query_description")
    the_tarot_card.arcana = params.fetch("query_arcana")

    if the_tarot_card.valid?
      the_tarot_card.save
      redirect_to("/tarot_cards/#{the_tarot_card.id}", { :notice => "Tarot card updated successfully."} )
    else
      redirect_to("/tarot_cards/#{the_tarot_card.id}", { :alert => "Tarot card failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tarot_card = TarotCard.where({ :id => the_id }).at(0)

    the_tarot_card.destroy

    redirect_to("/tarot_cards", { :notice => "Tarot card deleted successfully."} )
  end
end


# enum
# enum({ :arcana => { :major => 0, :minor => 1 } })

# direct associations
# has_many(:daily_spreads, { :dependent => :destroy })

# indirect associations 
# has_many(:users, { :through => :daily_spreads, :source => :user })
