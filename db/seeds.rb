# This file should contain all the record creation needed to seed the database with its default values.
#encoding: utf-8
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    State.delete_all
    State.create([{:name => '2'},{:name => '2'},{:name =>'2'},{:name => '2'},{:name => '2'},{:name => '2'}]);
    Department.delete_all
    Department.create([{:name=>"1"},{:name=>'1'},{:name=>'1'}]);
