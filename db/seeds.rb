# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

if SafeType.count==0
  SafeType.create!([{name: 'Сейф ТТ'}, {name: 'Сейф Упр'}, {name: 'р/счет'}])
end

if Role.count==0
  Role.create!([{name: 'Управляющий'}, {name: 'Документооборот'}, {name: 'Закупки'}, {name: 'Продажи'}, {name: 'Отдел кадров'}, {name: 'Финансы'}])
end

Organisation.all.each do |o|
Department.where('organisation_id is null AND code1c LIKE ?', o.code1c+'%').each do |d|
  puts d.name
  d.update(organisation_id: o.id)
end
end

Expense.where('date < ?', Date.today.beginning_of_month).destroy_all
MoneyTransfer.where('doc_date < ?', Date.today.beginning_of_month).destroy_all

# Expense.all.each do |e|
#   if e.organisation_id.nil?
#     e.update(organisation_id: e.department.organisation_id) 
#     puts "e.department.organisation_id #{e.department.organisation_id}"
#   end
# end

# MoneyTransfer.all.each do |e|
#   if e.from_id.nil?
#     # e.update(organisation_id: e.department.organisation_id) 
#     puts "e.safe_froms.organisation_id #{e.department.organisation_id}"
#   end
# end