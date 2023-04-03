class CardsController < ApplicationController
  before_action :set_list
  
  def show
  end

  def create
    @list.cards.build(card_params)

    if @list.save
      redirect_to board_url @list.board_id, notice: 'List was successfully created.'
    else
      render redirect_to board_url @list.board_id
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    respond_to do |format|
      format.html { redirect_to board_path(params[:board_id]), notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def card_params
    params.require(:card).permit(:name, :content)
  end
end
