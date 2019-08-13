class ProductsController < ApplicationController

  def index
    @products = Product.where("category_id=1").order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @product = Product.new
    @product.build_product_image
  end

  def create
    product_params = params_int(set_product_params)
    @product = Product.new(product_params)
    binding.pry
    @product.save!
    redirect_to root_path, notice: '商品が出品されました'
  end

  def edit
  end

  def show
    @product = Product.find(params[:id])
    @exhibituser = User.find(@product.user_id)
    @category = Category.find(@product.category_id)
    @bland = Bland.find(@product.bland_id)
  end

  def update
  end

  def destroy
  end

  private

  def set_product_params
    params.require(:product).permit(:name,
                                    :description,
                                    :category_id,
                                    :sub_category_id,
                                    :item_id,
                                    :bland_id,
                                    :size,
                                    :product_quality,
                                    :shipping_price,
                                    :shipping_way,
                                    :shipping_place,
                                    :shipping_date,
                                    :price,
                                    product_image_attributes: [:id, :product_id, :image])
  end

  def params_int(product_params)
    product_params.each do |key,value|
      unless key == "name" || key == "description" || key == "product_image" || key == "image" || key == "product_image_attributes" || key == null
        product_params[key] = value.to_i
      end
    end
  end

end
