require 'httparty'
require 'crack'
require 'hashie'
require 'pry'

When (/^I set QAMODE to "([^"]*)"$/) do |mode|
	if mode == "true"
        get(qamode_true_url)
    else
        safe_get(qamode_false_url)
    end

    def qamode_true_url
      url 'http://zgbwcactxqa7003.jupiter.bbc.co.uk:81/api/qamode/true'
    end
    def qamode_false_url
      url 'http://zgbwcactxqa7003.jupiter.bbc.co.uk:81/api/qamode/false'
    end
end