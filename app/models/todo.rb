class Todo < ApplicationRecord
    validates :title, presence: true
    attr_accessor :starttimehour
    attr_accessor :starttimemin
    attr_accessor :item
    attr_accessor :itemmoney
    attr_accessor :remark
    has_many :accounts, dependent: :destroy
end
