module ActsAsBookable
  module Bookable

    def bookable?
      false
    end

    ##
    # Make a model bookable
    #
    # Example:
    #   class Room < ActiveRecord::Base
    #     acts_as_bookable
    #   end
    def acts_as_bookable
      bookable
    end

    private

    # Make a model bookable
    def bookable
      unless bookable?
        class_eval do
          has_many :bookings, as: :bookable, dependent: :destroy, class_name: '::ActsAsBookable::Booking'

          def self.bookable?
            true
          end
        end
      end
    end

  end
end