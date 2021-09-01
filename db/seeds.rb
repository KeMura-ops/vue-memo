5.times do
  Memo.create(
    title: Faker::Lorem.word,
    desc: Faker::Lorem.sentence,
  )
end