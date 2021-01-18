class CreateGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|

      t.string        :goods_name,      null:false
      t.integer       :goods_price,     null:false
      t.text          :goods_text,      null:false
      t.integer       :category_id,     null:false 
      t.integer       :good_state_id,   null:false
      t.integer       :delivery_fee_id, null:false
      t.integer       :ship_area_id,    null:false
      t.integer       :day_id,          null:false
      t.references    :user,            foreign_key:true

      t.timestamps
    end
  end
end
