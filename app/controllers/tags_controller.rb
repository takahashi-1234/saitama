class TagsController < ApplicationController
  def show
    @tag=Tag.find(params[:id])
    @tags = Tag.order(created_at: :desc).page(params[:page])
  end
end
