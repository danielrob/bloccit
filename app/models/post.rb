class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  # see http://stackoverflow.com/questions/1834159/overriding-a-rails-default-scope
  #default_scope { order('created_at DESC') }


  # Scope Syntax a)
  def self.ordered_by_title
    order(title: 'ASC')
  end

  # Scope syntax b)
  scope :ordered_by_reverse_created_at, -> { order(created_at: :ASC)}
end
