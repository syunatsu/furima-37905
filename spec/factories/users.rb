FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              {Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.free_email}
    password              {'a1' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    last_name             {person.last.kanji}
    first_name            {person.first.kanji}
    last_name_kana        {person.last.katakana}
    first_name_kana       {person.first.katakana}
    birthday              {Faker::Date.between(from: '1930-01-01', to: Date.today)}
  end
end