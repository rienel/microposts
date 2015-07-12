class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def self.search(search)
    if search
      Micropost.where(['content LIKE ?', "%#{search}%"])
    else
      Micropost.all #全て表示。
    end
  end

  # お気に入り登録しているか確認
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end