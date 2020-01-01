class Todo < ApplicationRecord
    validates :title, presence: true
    attr_accessor :starttimehour
    attr_accessor :starttimemin
    attr_accessor :item
    attr_accessor :itemmoney
    has_many :accounts, dependent: :destroy
end
