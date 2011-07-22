# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#   Task.delete_all
#   Task.create([{:name => 'modify rush in text',:description => 'cut someting'},{:name => '修改抢注页',:description => '把温馨提示的内容去掉'}]);
#   State.delete_all
#   State.create([{:name => '测试中'},{:name => '已发布外网'},{:name =>'开发中'},{:name => '需求已提交'}]);
#    User.create([{:name =>'豆丁'},{:name => '翘尾狐'},{:name =>'无忌'},{:name=>'柠檬'},{:name=>'黑皮'},{:name=>'彩虹'},{:name=>'智羽'},{:name=>'旭辰'},{:name=>'晴天'},{:name=>'毛豆'},{:name=>'雪碧'},{:name=>'海啸'},{:name=>'长城'}]);
#   Department.create([{:name=>"平台开发部"},{:name=>'测试部'},{:name=>'需求部门'}]);
    UserDepartmentShip.create([{:user_id=>5,:department_id=>1},{:user_id=>3,:department_id=>1},{:user_id=>13,:department_id=>2}]);
