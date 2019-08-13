Product.create!(
  name: "パーカー",
  price: 0,
  size: 0,
  description: "おすすめです",
  favorite: 1,
  product_quality: 0,
  shipping_price: 0,
  shipping_way: 0,
  shipping_place: 0,
  shipping_date: 0,
  user_id: 1,
  bland_id: nil,
  category_id: 1,
  sub_category_id: 1,
  item_id: 1,
  created_at: "2019-01-01 00:00:00",
  updated_at: "2019-01-01 00:00:00"
)

Category.create!(
  [
   {
    name: 'シャツ',
    created_at: "2019-01-01 00:00:00",
    updated_at: "2019-01-01 00:00:00"
   },
   {
    name: 'パーカー',
    created_at: "2019-01-01 00:00:00",
    updated_at: "2019-01-01 00:00:00"
   }
  ]
)

SubCategory.create!(
  [
   {
    name: 'シャツ',
    category_id: "1",
    created_at: "2019-01-01 00:00:00",
    updated_at: "2019-01-01 00:00:00"
   },
   {
    name: 'パーカー',
    category_id: "1",
    created_at: "2019-01-01 00:00:00",
    updated_at: "2019-01-01 00:00:00"
   }
  ]
)

Item.create!(
  [
   {
    name: 'シャツ',
    sub_category_id: "1",
    created_at: "2019-01-01 00:00:00",
    updated_at: "2019-01-01 00:00:00"
   },

   {
    name: 'パーカー',
    sub_category_id: "1",
    created_at: "2019-01-01 00:00:00",
    updated_at: "2019-01-01 00:00:00"
   }
  ]
)