FactoryBot.define do
  factory :task do
    title { 'MyString' }
    task_list { build(:task_list) }
    description { 'MyText' }
    open { true }

    factory :task_with_subtasks do
      title { 'MyString' }
      task_list { build(:task_list) }
      description { 'MyText' }
      open { true }
      subtasks { build_list(:subtask, 5) }
    end
  end
end
