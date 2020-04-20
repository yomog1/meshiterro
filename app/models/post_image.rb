class PostImage < ApplicationRecord
	belongs_to :user
	attachment :image
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    validates :shop_name, presence: true
    validates :image, presence: true


# def favorited_by(current_user)
    def favorited_by?(user)
    	# favroites = postImageに紐づけられているfavorites
    	# whereは対象となるものを全て取ってくる
    	# favoriteて-ブルのuser_idは現在の遊佐のID
       favorites.where(user_id: user.id).exists?
    end
end
