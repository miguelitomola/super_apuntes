# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed some notes

##################################################

Community.create(name: 'IronHack-Generation',
	description: 'Curso de desarrollo web de la primera edición del programa Generation')

Community.create(name: 'Marketing-Generation',
	description: 'Curso de marketing digital de la primera edición del programa Generation')


##################################################

Note.create(title: 'Nota de IronHack 1', 
	body: 'Esta es una la nota de IronHack uno',
	community_id: 1)

Note.create(title: 'Nota de IronHack 2', 
	body: 'Esta es la nota de IronHack dos',
	community_id: 1)

Note.create(title: 'Nota de Marketing 1', 
	body: 'Esta es la nota de Marketing uno',
	community_id: 2)

Note.create(title: 'Nota de Marketing 2', 
	body: 'Esta es la nota de Marketing dos',
	community_id: 2)

##################################################
User.create(username: User.admin_name, 
	email:'admin@superapuntes.com', 
	password: '1234', 
	password_confirmation: '1234')
