class Account < ApplicationRecord
    belongs_to :todo
    attr_accessor :deletecheck
    validates :amount, presence: true
end
