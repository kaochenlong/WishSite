class WishListController < ApplicationController

  def card
  end

  def new_wish
  end

  def create_wish
    # 準備寫入資料庫
    # Strong Parameters
    clean_params = params.require(:w).permit(:title, :description)

    w = WishList.new(clean_params)

    if w.save
      render html: "ok"
    else
      render html: "fail"
    end
  end
end
