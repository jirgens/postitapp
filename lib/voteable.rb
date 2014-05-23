# # using concerns
# module Voteable
# 	extend ActiveSupport::Concern 

# 	included do 
# 		has_many :votes, as: :voteable
# 	end

# 	def total_votes
# 		self.up_votes - self.down_votes
# 	end

# 	def up_votes
# 		self.votes.where(vote: true).size
# 	end

# 	def down_votes
# 		self.votes.where(vote: false).size
# 	end
# end


# module Voteable
# 	def self.included(base)
# 		base.send(:include, InstanceMethods)
# 		base.extend ClassMethods
# 	end

# 	module InstanceMethods
# 		def total_votes
# 			up_votes - down_votes
# 		end

# 		def up_votes
# 			self.votes.where(vote: true).size
# 		end

# 		def down_votes
# 			self.votes.where(vote: false).size
# 		end
# 	end

# 	module ClassMethods
# 		def my_class_method
# 			has_many :votes, as: :voteable
# 		end
# 	end
# end