class Topic < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :topic_tag_relations, dependent: :destroy
    has_many :tags, through: :topic_tag_relations, dependent: :destroy

    scope :latest, -> { order(created_at: :desc) }  #desc = 降順
    scope :old, -> { order(created_at: :asc) }  #asc = 昇順
    scope :most_favorited, -> { includes(:likes)
    .sort_by { |x| x.likes.size }.reverse }
end
