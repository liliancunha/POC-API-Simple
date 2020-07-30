require 'cucumber'
require 'rspec'
require 'httparty' 
require 'allure-cucumber'
require "ostruct" 
require 'pry'

AMBIENTE = ENV['AMBIENTE']

URL = YAML.load_file("features/support/config.yml")
 
AllureCucumber.configure do |configuration|    
    configuration.results_directory = "allure-report"
    configuration.clean_results_directory = true
    configuration.logging_level = Logger::INFO
    configuration.link_tms_pattern = "http://www.hiptest.com/browse/{}"
    configuration.link_issue_pattern = "http://www.jira.com/browse/{}"
    configuration.tms_prefix      = '@TESTPLAN'
    configuration.issue_prefix    = '@TESTECASE'    
end