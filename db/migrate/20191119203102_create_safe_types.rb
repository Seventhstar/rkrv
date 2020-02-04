class CreateSafeTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :safe_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
