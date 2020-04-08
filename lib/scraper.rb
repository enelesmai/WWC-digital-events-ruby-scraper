require('nokogiri')
require('open-uri')
require_relative('../lib/event.rb')
class Scraper
  attr_reader :doc
  attr_reader :schedule

  # rubocop:disable Security/Open
  def initialize(uri, is_local)
    f = is_local ? File.open(uri) : open(uri)
    @doc = Nokogiri::HTML(f)
  end
  # rubocop:enable Security/Open

  def parse_events(search = nil)
    Event.clear
    @doc.css('p[dir=ltr]').each_with_index do |item, index|
      link = @doc.css('p a')[index + 2]['href']
      name = @doc.css('p a')[index + 2].text
      date = item.text

      if (!search.nil? && name.upcase.include?(search.upcase)) || search.nil?
        Event.new(name, date, link) unless empty_date?(date)
      end
    end
    Event.all
  end

  def display_events
    string_events = "=========================\n"
    if Event.total_events.positive?
      Event.all.each do |event|
        string_events += "DATE: #{event.date} \n"
        string_events += "NAME: #{event.name} \n"
        string_events += "LINK: #{event.link} \n"
        string_events += "---------------------- \n"
      end
    else
      string_events += "No matches found!\n"
    end
    string_events += "=========================\n"
    string_events += "#{Event.total_events} events.\n"
    string_events
  end

  def result
    Event.all
  end

  def create_csv
    CSV.open('events.csv', 'w') do |csv|
      result.each do |event|
        csv << [event.date, event.name, event.link]
      end
    end
  end

  private

  def empty_date?(date)
    date.empty? || date.empty? || date.size == 1
  end
end
