# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Expense.create!([
  {id: 1, description: 'Gasto de passagem aérea', date: '01/02/2016', price: 250},
  {id: 2, description: 'Combustível', date: '25/04/2016', price: 75},
  {id: 3, description: 'Escola', date: '14/05/2016', price: 500},
  {id: 4, description: 'Alimentação', date: '14/05/2016', price: 36.99},
  {id: 5, description: 'Materiais para escritório', date: '23/05/2016', price: 28},
  {id: 6, description: 'Lazer', date: '26/05/2016', price: 50},
  {id: 7, description: 'Roupas', date: '02/06/2016', price: 560}
  ])

  Receipt.create!([
    {id: 1, description: 'Gasto de passagem aérea', date: '01/02/2016', value: 250},
    {id: 2, description: 'Combustível', date: '25/04/2016', value: 75},
    {id: 3, description: 'Escola', date: '14/05/2016', value: 500},
    {id: 4, description: 'Alimentação', date: '14/05/2016', value: 36.99},
    {id: 5, description: 'Materiais para escritório', date: '23/05/2016', value: 28},
    {id: 6, description: 'Lazer', date: '26/05/2016', value: 50},
    {id: 7, description: 'Roupas', date: '02/06/2016', value: 560}
    ])
