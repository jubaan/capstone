# unless Group.find_by(name: 'Not Assigned')
#   Group.create({ name: 'Not Assigned' })
# end

unless User.find_by_name('User')
  user = User.create(name: 'User', email: 'user@user.com', password: 123_456)
end

5.times do
  Group.create(user: user, name: Faker::Commerce.unique.department(max: 1), icon: 'icon')
end

100.times do
  Expense.create(
    name: Faker::Commerce.product_name,
    amount: Faker::Commerce.price,
    author: user,
    group: Group.all.uniq.sample
  )
end
