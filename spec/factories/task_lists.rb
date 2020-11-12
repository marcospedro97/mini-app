FactoryBot.define do
  factory :task_list do
    user { build(:user) }
    public { true }
    title { 'MyString' }
    description { 'MyText' }

    factory :task_list_with_tasks do
      user { build(:user) }
      public { true }
      title { 'MyString' }
      description { 'MyText' }
      tasks { build_list(:task, 5)}
    end
  end
end
