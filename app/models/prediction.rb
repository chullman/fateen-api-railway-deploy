class Prediction < ApplicationRecord
  belongs_to :category
  belongs_to :user

  def self.find_by_category(input)
    category = Category.find_by(name: input.capitalize)
    return self.where(category: category)
  end

  def transform_prediction
    return {
      name: self.user.name,
      username: self.user.username,
      email: self.user.email,
      category: self.category.name,
      description: self.description,
      posted: self.created_at,
      edited: self.updated_at
    }
  end
end
