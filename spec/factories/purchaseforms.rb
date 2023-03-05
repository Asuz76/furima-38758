FactoryBot.define do
  factory :purchaseform do
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'横浜市緑区'}
    adress {'青山1-1-1'}
    building {'柳ビル103'}
    phone_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}

    association :user_id
    association :item_id
  end
end