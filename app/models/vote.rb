class Vote < ActiveRecord::Base
	belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
	belongs_to :voteable, polymorphic: true

	validates_uniqueness_of :creator, scope: :voteable

	#scope: :voteable makes it so user can vote on each object once, not just only one vote total

end