unless Group.all.find_by(name: 'Not Assigned')
  Group.create({ name: 'Not Assigned' })
end

julio = User.create(name: 'Julio', email: 'julio.ab@julio.com', password: 123_456)

5.times do
  Group.create(name: Faker::Commerce.unique.department(max: 1), icon: 'icon')
end

10.times do
  Expense.create(
    name: Faker::Commerce.product_name,
    amount: Faker::Commerce.price,
    author: julio
    group: Group.all.sample
  )
end
