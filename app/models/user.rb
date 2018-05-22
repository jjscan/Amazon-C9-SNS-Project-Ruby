class User < ApplicationRecord
  # carrierwave (image uploader)
  mount_uploader :profile, ProfileUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 코멘트, 포스트, 좋아요 기능 Relations 정의
  has_many :comments
  has_many :posts
  # User와 Like는 1:N 관계
  has_many :likes
  # 1:N 관계인 likes를 이용해서 Post와 N:N 관계를 구현
  # 특정 유저가 좋아요를 누른 posts를 얻을 수 있음.
  # ex) user.likes_posts
  has_many :liked_posts, through: :likes, source: :post 
  # Follow 목록 반환
  has_many :follower_relations, foreign_key: "followed_id", class_name: "Follow"
  # Followers 명단 반환
  has_many :followers, through: :follower_relations, source: :follower
  has_many :follower_relations, foreign_key: "followed_id", class_name: "Follow"
  # Following 명단 반환
  has_many :followers, through: :follower_relations, source: :follower
  has_many :following_relations, foreign_key: "follower_id", class_name: "Follow"
  has_many :followings, through: :following_relations, source: :followed
  def is_like?(post)
      Like.find_by(user_id: self.id, post_id: post.id).present?
  end

end
