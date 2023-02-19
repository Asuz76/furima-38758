FactoryBot.define do
  factory :purchaseform do
    user_id {1}
    item_id {2}
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'横浜市緑区'}
    adress {'青山1-1-1'}
    building {'柳ビル103'}
    phone_number {'09012345678'}
    # token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
