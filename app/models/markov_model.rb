class MarkovModel < ActiveRecord::Base
  self.primary_keys = :word, :next_word
end
