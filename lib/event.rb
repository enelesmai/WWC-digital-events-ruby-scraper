class Event
  attr_reader :name, :date, :link
  # rubocop:disable Style/ClassVars
  @@all = []
  # rubocop:enable Style/ClassVars

  def initialize(name, date, link)
    @name = name
    @date = date
    @link = link
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

  def self.total_events
    @@all.count
  end
end
