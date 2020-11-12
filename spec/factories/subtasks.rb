FactoryBot.define do
  factory :subtask do
    title { 'MyString' }
    description { 'MyText' }
    task { build(:task) }
  end
end
