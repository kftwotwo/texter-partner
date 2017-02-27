FactoryGirl.define do
  factory :message do
    to "1111111111"
    from "2222222222"
    body "Hello World"
  end
end
