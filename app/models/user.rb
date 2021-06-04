class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }

  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 被フォロー関係を通じて参照→followed_idをフォローしている人

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 【class_name: "Relationship"】は省略可能
  has_many :followings, through: :relationships, source: :followed
  # 与フォロー関係を通じて参照→follower_idをフォローしている人
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
end
