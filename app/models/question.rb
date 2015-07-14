class Question < ActiveRecord::Base
  acts_as_votable

  validates :option_a, :presence => true
  validates :option_b, :presence => true

  def average_a
    if (self.get_upvotes.size > 0)
      upvotes = self.get_upvotes.size.to_f
      total = self.votes_for.size.to_f
      result = upvotes/total*100
    else
      result = 0
    end
    return result
  end

  def average_b
    if (self.get_downvotes.size > 0)
      downvotes = self.get_downvotes.size.to_f
      total = self.votes_for.size.to_f
      result = downvotes/total*100
    else
      result = 0
    end
    return result
  end
end
