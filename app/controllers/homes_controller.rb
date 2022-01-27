class HomesController < ApplicationController
  def top
    @tags = Tag.order(created_at: :desc).page(params[:page])
  end
end
