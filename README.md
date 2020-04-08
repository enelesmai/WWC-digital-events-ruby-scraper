# Women Who Code Events Scraper

This project was created to display remote/digital events from [Women Who Code Digital](https://www.womenwhocode.com/digital), which is a community that provide events for empowering women in technology.


## Project specifications

This app use [Nokogiri gem](https://github.com/sparklemotion/nokogiri) to extract info and displays all the events grabed on the original page and also provide a way to search events by keywords.It shows the date and also provide the link to register on each event.


## Usage

You can clone or download this repo (you need ruby installed in your computer).

    git clone git@github.com:enelesmai/Ruby-Scraper.git

Move to the app directory

    cd Ruby-scraper

And run the next instruction to get the gems that are needed for this project
    
    bundle install

**IMPORTANT**
To run this application you should add execute permissions to the main file. [Here](https://commandercoriander.net/blog/2013/02/16/making-a-ruby-script-executable/) you can find more information. 

    chmod 755 main.rb

And after that you can start the app by typing

    ./bin/main.rb


## Testing with RSpec 

To run the test cases with RSpec we have to follow this steps:

installing RSpec

    gem install rspec

Once that’s done, you can verify your version of RSpec with, for this project we had used the version 3.9 

    rspec --version

finally run for watch the results

    rspec


## Instructions

This scraper extracts the information from Women Who Code page, you can use it for showing this info in another place or making another wonderful application to share these events!

This application starts with a menu:

    ===================
    Select an option:
    1. Show all events
    2. Search an event
    3. Exit
    ===================

If you choose all events it is going to display the all list of existent events:

    DATE:  3 Part Mini Data Science Bootcamp (Learn the data science stack / tools and how to approach DS projects with WWCode Data Science  
    NAME: WWCode San Diego 
    LINK: http://womenwhocode.com/sandiego 

You can also choose option 2) Search an event and type a keyword to look for. Example:

    What are you looking for?: Javascript

    =========================
    DATE: MON 6 APR | 00:00 UTC (6:00 PM MDT) 
    NAME: Monthly JavaScript Study Series 
    LINK: https://www.meetup.com/Women-Who-Code-Boulder-Denver/events/lxxdnrybcgbjb/ 
    ---------------------- 
    DATE: TUES 5 MAY | 18:00 UTC (7:00 PM British Summer Time)  
    NAME: Gimgen - Dive Deep Into Javascript Generators 
    LINK: https://zoom.us/webinar/register/WN_hbOmFdHuTfu69RaHDb3GbA 
    ---------------------- 
    =========================
    2 events.

Enjoy it!


## Built With

Concepts used on this project

- Ruby
- OOP 
- Describe, it and context for testing with RSpec

Tools used on this project

- Visual Studio Code
- VSCode Ruby by Stafford Brunk 0.27.0
- Rubocop 0.8.3
- RSpec 3.9
- Nokogiri gem


## Screenshot

![screenshot](https://user-images.githubusercontent.com/5160907/78702038-93b59080-78cd-11ea-884d-d8fc4f20fc3e.png)


## Live Demo

You can see the [live preview](https://repl.it/@enelesmai/Ruby-Scraper)


## Author

👤 **Xóchitl Selene Flores Pérez**

- Github: [@enelesmai](https://github.com/enelesmai)
- Twitter: [@enelesmai](https://twitter.com/enelesmai)
- Linkedin: [xochitlselene](https://linkedin.com/in/xochitlselene)


## Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues](https://github.com/enelesmai/Ruby-Scraper/issues).


## Show your support

Give a ⭐️ if you like this project!


## License

This project is [MIT](lic.url) licensed.
