class CreateUserWeights < ActiveRecord::Migration[6.0]
  def change
    create_table :user_weights do |t|
      t.decimal :weight, precision: 3, scale: 1
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
