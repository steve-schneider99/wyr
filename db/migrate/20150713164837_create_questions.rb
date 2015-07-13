class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :option_a, :string
      t.column :option_b, :string

      t.timestamps
    end
  end
end
