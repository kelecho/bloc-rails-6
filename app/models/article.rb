class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user

    has_many :has_categories
    has_many :categories, through: :has_categories

    attr_accessor :category_elements


    def save_categories

        return has_categories.destroy_all if category_elements.nil? || category_elements.empty?

        has_categories.where.not(category_id: category_elements).destroy_all

        category_elements.each do |category_id|
            HasCategory.find_or_create_by(category_id: category_id.to_i, article_id: self.id)
        end
        
    end
    
end
