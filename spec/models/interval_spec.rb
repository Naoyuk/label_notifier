# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Interval, type: :model do
  it "is invalid without day" do
    interval_without_day = FactoryBot.build(:interval, day: nil)
    expect(interval_without_day).not_to be_valid
  end

  it "is invalid without copies_per_day" do
    interval_without_copies_per_day = FactoryBot.build(:interval, copies_per_day: nil)
    expect(interval_without_copies_per_day).not_to be_valid
  end

  describe "#calc_day" do
    it "calculates next day of notice" do
      print_last = FactoryBot.create(:print, print_on: Time.zone.today - 6, copies: 100)
      print_this = FactoryBot.create(:print, print_on: Time.zone.today, copies: 100)
      copies_per_day = 10
      day = 100 / copies_per_day
      interval = Interval.create(day:, copies_per_day:)
      expect(interval.calc_day).to eq Time.zone.today + day
    end
  end
end
