class Show < ActiveRecord::Base

  def self.highest_rating
    all.maximum(:rating)
  end

  def self.most_popular_show
    all.find do |show|
      show.rating == self.highest_rating
    end
  end

  def self.lowest_rating
    all.minimum(:rating)
  end

  def self.least_popular_show
    all.find do |show|
      show.rating == self.lowest_rating
    end
  end

  def self.ratings_sum
    self.sum(:rating)
  end

  def self.popular_shows
    self.where("rating > 5")
  end

  def self.shows_by_alphabetical_order
    self.order(:name)
  end
end
