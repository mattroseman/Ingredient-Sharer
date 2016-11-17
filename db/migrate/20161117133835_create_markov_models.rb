class CreateMarkovModels < ActiveRecord::Migration
  def change
    create_table :markov_models do |t|
      t.string :word, :null => false, :primary_key => true
      t.string :next_word, :null => false, :primary_key => true
      t.integer :count, :null => false, :default => 1

      t.timestamps null: false
    end
  end
end
