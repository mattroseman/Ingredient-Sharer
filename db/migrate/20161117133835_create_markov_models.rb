class CreateMarkovModels < ActiveRecord::Migration
  def change
    create_table :markov_models , id: false do |t|
      t.string :word, :null => false, :primary_key => true
      t.string :next_word, :null => false, :primary_key => true
      t.integer :count, :null => false, :default => 1
    end
    execute("ALTER TABLE markov_models ADD PRIMARY KEY (word, next_word);")
  end
end
