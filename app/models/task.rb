# encoding: utf-8
class Task < ActiveRecord::Base
  belongs_to :state
  has_many :task_user_ships,:dependent => :destroy
  has_many :users,:through => :task_user_ships
  has_many :task_histories,:dependent => :destroy
  has_many :attachments,:dependent => :destroy
  accepts_nested_attributes_for :attachments,:allow_destroy => true
  validates_presence_of :name,:message => "任务名不能为空"
  validates_format_of :submit_test_date,:submit_test_over_date,:submit_deliver_date,:allow_nil => true,:with => /(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)/
  
  scope :today_test,where(["submit_test_date >= ? and submit_test_date <= ?",Time.now.beginning_of_day,Time.now.end_of_day])
  scope :today_test_over,where(["submit_test_over_date >= ? and submit_test_over_date <= ?",Time.now.beginning_of_day,Time.now.end_of_day])
  scope :today_deliver,where(["submit_deliver_date >= ? and submit_deliver_date <= ?",Time.now.beginning_of_day,Time.now.end_of_day])
  scope :today_all,where(["(submit_deliver_date >= ? and submit_deliver_date <= ?) or (submit_test_over_date >= ? and submit_test_over_date <= ?) or (submit_test_date >= ? and submit_test_date <= ?)",Time.now.beginning_of_day,Time.now.end_of_day,Time.now.beginning_of_day,Time.now.end_of_day,Time.now.beginning_of_day,Time.now.end_of_day])

  scope :thisweek_test,where(["submit_test_date >= ? and submit_test_date <= ?",Time.now.beginning_of_week,Time.now.end_of_week])
  scope :thisweek_test_over,where(["submit_test_over_date >= ? and submit_test_over_date <= ?",Time.now.beginning_of_week,Time.now.end_of_week])
  scope :thisweek_deliver,where(["submit_deliver_date >= ? and submit_deliver_date <= ?",Time.now.beginning_of_week,Time.now.end_of_week])
  scope :thisweek_all,where(["(submit_deliver_date >= ? and submit_deliver_date <= ?) or (submit_test_over_date >= ? and submit_test_over_date <= ?) or (submit_test_date >= ? and submit_test_date <= ?)",Time.now.beginning_of_week,Time.now.end_of_week,Time.now.beginning_of_week,Time.now.end_of_week,Time.now.beginning_of_week,Time.now.end_of_week])
end
