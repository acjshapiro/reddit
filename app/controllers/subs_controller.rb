class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :update, :edit, :destroy]

  def index
    @subs = Sub.all
  end

  def show; end

  def new
    @sub = Sub.new
  end

  def edit; end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_path(@sub)
    else
      render :new
    end
  end

  def update
    if @sub.update(sup_params)
      redirect_to sub_path(@sub)
    else
      render :edit
    end
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
  end

  private

  def sub_params
    params.require(:sub).permit(:name)
  end

  def set_sub
    @sub = Sub.find(params[:id])
  end
end
