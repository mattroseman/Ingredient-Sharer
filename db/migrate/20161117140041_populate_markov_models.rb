class PopulateMarkovModels < ActiveRecord::Migration
  def up
    #If the markov_models.sql file every needs to be regenerated, or another seed book is going to be used then uncomment and
    #rerun this merge. Otherwise load markov_models.sql outside of ruby.
    ##
    #File.open("sherlock.txt", "r") do |f|
    #  prev_word = ""
    #  f.each_line do |line|
    #    word_list = line.split
    #    word_list.each do |word|
    #      word = word.gsub(/[^0-9A-Za-z']/, '')
    #      execute ("INSERT INTO `markov_models` (word, next_word, count) VALUES (\"#{prev_word}\", \"#{word}\", 1) ON DUPLICATE KEY UPDATE count = count + 1;")
    #      prev_word = word
    #    end
    #  end
    #end
  end

  def down
    MarkovModel.delete_all
  end
end
