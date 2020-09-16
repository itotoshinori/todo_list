class Todo < ApplicationRecord
    validates :title, presence: true
    attr_accessor :starttimehour
    attr_accessor :starttimemin
    attr_accessor :item
    attr_accessor :itemmoney
    attr_accessor :remark
    attr_accessor :category_id
    attr_accessor :category_id2
    attr_accessor :category_id3
    has_many :accounts, dependent: :destroy
end
