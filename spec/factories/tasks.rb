FactoryBot.define do
  factory :task do
    title { 'MyString' }
    task_list { build(:task_list) }
    description { 'MyText' }
    open { true }
  end
end
