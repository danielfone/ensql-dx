# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding 1000 events"
Event.connection.exec_insert <<~SQL
  insert into events (occurred_at, email, event_type)
  select
    now() - concat(i, ' hours')::interval - concat(random() * 60, ' minutes')::interval as occurred_at,
    concat('user', (random() * 4)::int, '@example.com') as email,
    (array['updated', 'purchased', 'signed-in', 'messaged', 'commented', 'viewed'])[random() * 5 + 1] as event_type
  from generate_series(1,1000) as i
SQL
