# clean\_ignore\_list

## Introduction

This script uses [Selenium WebDriver](http://www.seleniumhq.org/) to select
archived geocaches in your [Geocaching](https://www.geocaching.com/) ignore
list for bulk deletion. The script does not actually perform the bulk deletion
but merely takes you to the page, in Safari, where you can confirm or cancel
the bulk deletion.

Selenium WebDriver and web scraping are unfortunately necessary because
Groundspeak is not accepting new requests for API access. I would love to work
with their API to make utility scripts such as this but they have not been open
for quite a while.

Selenium WebDriver works with some of the most common web browsers. The reason
for preferring Safari here is because Selenium is able to launch a Safari
instance with the user's cookies, avoiding the need to log in to the Geocaching
website again. Chrome and Firefox, on the other hand, launch as blank/incognito
browsers under Selenium.

## Installation

First, you need to install Selenium SafariDriver:

* Download SafariDriver from [Selenium Downloads](http://www.seleniumhq.org/download/).
* Open SafariDriver.safariextz in Finder to install it in Safari.

Then you need to install the required Ruby gem:

    gem install selenium-webdriver

## Usage

First, make sure that you're already logged in to the Geocaching website on Safari.

Then run the script:

    ruby clean_ignore_list.rb

The script will navigate to your lists page and bring up the ignore list. When
it's done selecting caches for deletion, it will prompt you to take a look at
the list in Safari before continuing.

