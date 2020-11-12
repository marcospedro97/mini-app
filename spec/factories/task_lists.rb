FactoryBot.define do
  factory :task_list do
    user { nil }
    public { '' }
    title { 'MyString' }
    description { 'MyText' }
  end
end
