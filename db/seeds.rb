# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed some notes

Note.create(title: 'Nota de prueba', 
	body: 'Esta es una la nota de prueba uno')

Note.create(title: 'Nota de prueba 2', 
	body: 'Esta es una la nota de prueba dos')