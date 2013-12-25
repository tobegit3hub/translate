#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'net/http'
require 'json'
require 'puts_color'
include PutsColor

'''
# result format of "tobe"
{
  "translation" => ["托比"],
  "basic" => {
    "phonetic" => "tɔbe",
    "explains" => ["n. 托比（男子名）"]
  },
  "query" => "Tobe",
  "errorCode" => 0,
  "web"=>[{"value"=>["酷比", "裕隆酷比", "高嘉宇"], "key"=>"Tobe"}, {"value"=>["托比", "导", "导演"], "key"=>"Tobe Hooper"}, {"value"=>["金山町戸部"], "key"=>"Kanayamacho Tobe"}]
}
'''

def puts_translate(string)
  puts " >>> " + string
end

def translate(word)
  
  uri = URI.parse("http://fanyi.youdao.com/openapi.do")
  params = {:keyfrom => "chendihao", :key => "707664099", :type => "data", :doctype => "json", :version => "1.1"}
  params[:q] = word
  uri.query = URI.encode_www_form(params)

  response = Net::HTTP.get_response(uri)
  result = JSON.parse(response.body)

  puts_translate "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
  puts_translate result["query"] + " " + result["translation"].join(", ")
  puts_translate ""
    result["basic"]["explains"].each do |explain|
    puts_translate explain
  end
  puts_translate ""
  result["web"].each do |kv|
    puts_translate kv["key"] + " " + kv["value"].join(", ")
  end
  puts_translate "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
  
end

if __FILE__ == $0
  word = ARGV.first
  translate word
end
