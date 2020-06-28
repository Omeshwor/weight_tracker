class ChangePrecisionOnUserWeights < ActiveRecord::Migration[6.0]
  def change
    change_column :user_weights, :weight, :decimal, :precision => 4, :scale => 1
  end
end
