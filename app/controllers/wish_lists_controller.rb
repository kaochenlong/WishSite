class WishListsController < ApplicationController

  def index
    @wish_lists = WishList.all
  end

  def new
    @wish_list = WishList.new
  end

  def create
    # Strong Parameters
    clean_params = params.require(:wish_list).permit(:title, :description)

    @wish_list = WishList.new(clean_params)

    if @wish_list.save
      redirect_to root_path, notice: "成功新增許願卡！"
    else
      render :new
    end
  end

  def show
    @wish_list = WishList.find(params[:id])
  end

  def edit
    @wish_list = WishList.find(params[:id])
  end

  def update
    @wish_list = WishList.find(params[:id])

    clean_params = params.require(:wish_list).permit(:title, :description)

    if @wish_list.update(clean_params)
      redirect_to root_path, notice: "成功更新許願卡！"
    else
      render :edit
    end
  end

  def destroy
    @wish_list = WishList.find(params[:id])
    @wish_list.destroy
    redirect_to root_path, notice: "資料已刪除"
  end
end
