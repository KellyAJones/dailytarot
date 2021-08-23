class DailySpreadsController < ApplicationController
  def index
    matching_daily_spreads = DailySpread.all

    @list_of_daily_spreads = matching_daily_spreads.order({ :created_at => :desc })

    render({ :template => "daily_spreads/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_daily_spreads = DailySpread.where({ :id => the_id })

    @the_daily_spread = matching_daily_spreads.at(0)

    render({ :template => "daily_spreads/show.html.erb" })
  end

  def create
    the_daily_spread = DailySpread.new
    the_daily_spread.tarot_card_id = TarotCard.all.sample.id
    the_daily_spread.user_id = @current_user.id
    the_daily_spread.sent = params.fetch("query_sent", false)

    if the_daily_spread.valid?
      the_daily_spread.save
      redirect_to("/tarot_cards/#{the_daily_spread.tarot_card_id}", { :notice => "Daily spread created successfully." })
    else
      redirect_to("/daily_spreads", { :notice => "Daily spread failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_daily_spread = DailySpread.where({ :id => the_id }).at(0)

    the_daily_spread.tarot_card_id = params.fetch("query_tarot_card_id")
    the_daily_spread.user_id = params.fetch("query_user_id")
    the_daily_spread.sent = params.fetch("query_sent", false)

    if the_daily_spread.valid?
      the_daily_spread.save
      redirect_to("/daily_spreads/#{the_daily_spread.id}", { :notice => "Daily spread updated successfully."} )
    else
      redirect_to("/daily_spreads/#{the_daily_spread.id}", { :alert => "Daily spread failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_daily_spread = DailySpread.where({ :id => the_id }).at(0)

    the_daily_spread.destroy

    redirect_to("/daily_spreads", { :notice => "Daily spread deleted successfully."} )
  end
end




