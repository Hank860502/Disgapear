class Essay < ActiveRecord::Base
	validates :topic, :description, :content, :word_limit, presence: true
end
