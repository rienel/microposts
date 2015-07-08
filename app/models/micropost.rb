class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def self.search(search)
    if search
      Micropost.where(['content LIKE ?', "%#{search}%"])
    else
      Micropost.all #全て表示。
    end
  end

end