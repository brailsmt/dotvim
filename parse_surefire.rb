#!/usr/bin/env ruby

require 'rexml/document'
include REXML

xmlResults = Dir['target/surefire-reports/*.xml']
xmlResults.each {|xml|
  puts xml
    doc = Document.new(File.new(xml))
    xpath = '//testcase/failure'
    XPath.each(doc, xpath) { |node|
        testcaseNode = node.parent
        classname = testcaseNode.attributes['classname'].split(/\./)[-1]
        location = node.text.split($/).grep(/\((#{classname}\..*):(\d+)/).first
        file = Dir["**/#{$1}"].first
        pathLine = "#{file}:#{$2}"

        if(node.attributes['message'] == nil)
            puts "#{pathLine}|    #{node.text.split($/)[0]}"
        else
            puts "#{pathLine}|    #{node.attributes['message'].split($/)[0]}"
        end
    }
}
