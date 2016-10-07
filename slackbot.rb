require 'http';
require 'json';

res = HTTP.post("https://slack.com/api/api.test")
puts JSON.pretty_generate(JSON.parse(res.body))
