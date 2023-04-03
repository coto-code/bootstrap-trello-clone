class ListsController < ApplicationController
  before_action :set_board

  def show
  end

  def create
    @list = @board.lists.build(list_params)

    if @list.save
      redirect_to @board, notice: 'List was successfully created.'
    else
      render redirect_to @board
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    respond_to do |format|
      format.html { redirect_to board_path(@board), notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
