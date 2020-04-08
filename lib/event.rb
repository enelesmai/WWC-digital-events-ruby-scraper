class Event
  attr_reader :name, :date, :link
  # rubocop:disable Style/ClassVars
  @@all = []
  # rubocop:enable Style/ClassVars

  def initialize(name, date, link)
    @name = name
    @date = clear(date)
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

  def self.show_selected(selected)
    @@all[selected]
  end

  private

  def clear(str)
    str = str.gsub('Â', '')
    str = str.gsub('ð«', '')
    str = str.lstrip
    str = str.rstrip
    str
  end
end
