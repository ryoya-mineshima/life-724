FactoryBot.define do
  factory :tweet do
    title {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
    url {"https://ja.wikipedia.org/wiki/HUNTER%C3%97HUNTER"}
    association :user 

    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
