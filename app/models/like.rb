class Like < ApplicationRecord
    # Like는 User와 Post의 id를 가지고 있음
    belongs_to :user
    belongs_to :post#, counter_cache: true
   # belongs_to :post, counter_cache: :count_of_likes
end
