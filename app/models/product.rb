class Product < ApplicationRecord
    enum shipping_price: [ ["shipping_price_blank"], ['送料込み（出品者負担）'], ['着払い（購入者負担）'] ]
    enum shipping_way: [ ["shipping_way_blank"], ['未定'], ['クロネコヤマト'], ['ゆうパック'],['ゆうメール'] ]
    enum shipping_date: [ ["shipping_date_blank"], ['1~2日で発送'],['2~3日で発送'],['4~7日で発送'] ]
    enum size: [ ["size_blank"],["XXS以下"], ["XS(SS)"], ["S"], ["M"], ["L"], ["XL"], ["2XL"], ["3XL"], ["4XL(5L)"], ["FREE SIZE"] ]
    enum product_quality: [  ["product_quality_blank"], ["新品、未使用"], ["目立った傷や汚れなし"], ["やや傷や汚れあり"], ["傷や汚れあり"], ["全体的に状態が悪い"] ]
    enum product_status: [ ["product_status_blank"],['未購入'],['購入済み'],['取引中'] ]


    belongs_to :user, optional: true
    has_one :bland
    has_one :region
    has_many :categorys
    has_many :images
    has_one :product_image
    has_many :comments
    accepts_nested_attributes_for :product_image

    validate :add_error_sample
   
    def add_error_sample

      if product_image.blank?
        errors[:base] << "画像は必ず選択して下さい"
      end

      if name.blank?
        errors[:base] << "商品名は必ず入力して下さい"
      elsif name.size >= 40
        errors[:base] << "商品名は40文字以内で入力して下さい"
      end
   
      if description.blank?
        errors[:base] << "商品説明文は必ず入力して下さい"
      elsif description.size >= 1000
        errors[:base] << "商品説明文は1000文字以内で入力して下さい"
      end

      if category_id==0
        errors[:base] << "カテゴリー欄第一項目は必ず選択して下さい"
      end

      if sub_category_id==0
        errors[:base] << "カテゴリー欄第二項目は必ず選択して下さい"
      end

      if item_id==0
        errors[:base] << "カテゴリー欄第三項目は必ず選択して下さい"
      end

      if bland_id.blank?
        errors[:base] << "ブランドは必ず入力して下さい"
      end

      if BlankCheck(size[0])
        errors[:base] << "サイズは必ず選択して下さい"
      end

      if BlankCheck(product_quality[0])
        errors[:base] << "商品の状態は必ず選択して下さい"
      end

      if BlankCheck(shipping_price[0])
        errors[:base] << "配送料の負担は必ず選択して下さい"
      end

      if BlankCheck(shipping_way[0])
        errors[:base] << "配送の方法は必ず選択して下さい"
      end

      if shipping_place[0]==0
        errors[:base] << "発送元の地域は必ず選択して下さい"
      end

      if BlankCheck(shipping_date[0])
        errors[:base] << "発送までの日数は必ず選択して下さい"
      end

      if price.to_i.zero?
        errors[:base] << "価格は必ず入力し、半角数字、かつ、1円以上から入力して下さい"
      end
    end

    def BlankCheck(str)
      target="blank"
      false != str.include?(target)
    end


end