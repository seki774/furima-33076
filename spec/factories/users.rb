FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}
    first_name            {"あ"}
    last_name             {"あ"}
    first_name_hurigana            {"ア"}
    last_name_hurigana            {"ア"}
    birthday              {'1988/04/07'}
  end
end