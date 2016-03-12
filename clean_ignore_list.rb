#!/usr/bin/env ruby

require 'selenium-webdriver'

def save_to fname, web
  File.open(fname, 'w') { |file| file.write web.page_source }
end

web = nil
begin
  web = Selenium::WebDriver.for :safari

  # Get the list of lists.
  web.get 'https://www.geocaching.com/my/lists.aspx'
  link = web.find_element :link, 'Ignore List'

  # Navigate to the ignore list.
  web.get link.attribute 'href'

  # Increase list display to 500 items.
  select = web.find_element :id, 'ctl00_ContentBody_ListInfo_cboItemsPerPage'
  options = select.find_elements :tag_name, 'option'
  options.each { |option|
    if option.attribute('value').to_i >= 500
      option.click
      break
    end
  }
  sleep 2  # Wait for the pulldown Javascript to finish.

  rows = web.find_elements :css, 'tbody tr'

  # Find all rows with archived caches and click the checkbox.
  rows.each { |row|
    oldwarning = row.find_elements :css, '.OldWarning'
    next if oldwarning.empty?

    puts "Archived cache: #{oldwarning.first.text}"
    
    row.find_element(:tag_name, 'input').click
  }

  # Click the Bulk Delete button.
  web.find_element(:id, 'ctl00_ContentBody_ListInfo_btnDelete').click

  # Wait for user to delete list items.
  print 'Confirm deletion and hit Enter when done: '
  gets
ensure
  web.close if web
end

__END__