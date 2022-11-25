# frozen_string_literal: true

class WishListsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_wish_list, only: %i[edit update destroy show like buy checkout]

  def index
    @wish_lists = current_user.wish_lists
  end

  def new
    @wish_list = WishList.new
  end

  def create
    @wish_list = current_user.wish_lists.build(wish_list_params)

    if @wish_list.save
      redirect_to root_path, notice: '成功新增許願卡！'
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @wish_list.comments.order(id: :desc)
  end

  def edit; end

  def update
    if @wish_list.update(wish_list_params)
      redirect_to root_path, notice: '成功更新許願卡！'
    else
      render :edit
    end
  end

  def destroy
    @wish_list.destroy
    redirect_to root_path, notice: '資料已刪除'
  end

  def like
    if @wish_list.liked_by?(current_user)
      # 移除 like
      current_user.liked_wish_lists.delete(@wish_list)
      render json: { status: 'unliked' }
    else
      # 新增 like
      current_user.liked_wish_lists << @wish_list
      render json: { status: 'liked' }
    end
  end

  def buy; end

  private

  def find_wish_list
    @wish_list = current_user.wish_lists.find(params[:id])
  end

  def wish_list_params
    params.require(:wish_list).permit(:title, :description, :publish_date, :amount)
  end
end
