#!/usr/bin/env ruby
# File name:  tmpl_gen.rb
# Author:     Michael Brailsford
# Created:    Sun Nov 24 01:51:27 MST 2002
# Copyright:  2002 Michael Brailsford
# Version:    $Revision$
# Contents:   Generates a template file for a .cpp file
# License: 	  This script is released under the BSD License.
#
#	Copyright (c) 2002, Michael Brailsford.  All rights reserved.
#	
#	Redistribution and use in source and binary forms, with or without
#	modification, are permitted provided that the following conditions are met:
#	
#   * Redistributions of source code must retain the above copyright notice,
#     this list of conditions and the following disclaimer.  
#   * Redistributions in binary form must reproduce the above copyright notice,
#	  this list of conditions and the following disclaimer in the documentation
#	  and/or other materials provided with the distribution.
#   * Neither the name of the Author nor the names of contributors may be used 
#     to endorse or promote products derived from this software without 
#     specific prior written permission.
#	
#	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#	AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#	IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
#	ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
#	THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#{{{
class HeaderFile
	attr_accessor :class_name, :methods, :ctors, :data_members
	#{{{
	def initialize(name)
		@methods = Array.new
		@ctors = Array.new
		@data_members = Array.new
		parse_header name
	end
	#}}}
	#{{{
	def parse_header(name)
		if FileTest.exist? name
			File.open(name) { |hdr|
				hdr.each { |line|
					case line
					when /^\s*class\s+(\w*)/
						@class_name = $1.strip
					#when /^(.*:)?\s*([\w<> \\*&]+)\s+(\w+)\((.*)\)\s*;/
					 when /^(.*:)?\s*(\w+(<[<>, \w\*&]+>)*)\s+(\w+)\((.*)\)\s*;/
						@methods << [$2.strip, $4.strip, $5.strip.split(/,\s*/)]
					when /^(.*:)?\s*(\w*)\((.*)\)\s*;/
						@ctors << [$2.strip, $3.strip.split(/,\s*/)]
					when /^(.*:)?\s*(\w+(<[<>, \w\*&]+>)*)\s+([^()]*);/
						type = $2.strip
						$4.split(",").each { |dat|
							@data_members << [type, dat.strip.gsub(/,\s*/, '')]
						}
					end
				}
			}
		else
			@class_name = "DEFAULT_CLASS_TEMPLATE"
		end
	end
	#}}}
	#{{{
	def to_s
		append $curbuf.count, "class:  \t#{@class_name}"
		append $curbuf.count, "methods:  \t#{@methods.join ' '}"
		append $curbuf.count, "ctors:  \t#{@ctors.join ' '}"
		append $curbuf.count, "data_members:  \t#{@data_members.join ', '}"
	end
	#}}}
end
#}}}
#{{{
class SourceFile
	#{{{
	def initialize
		@header = HeaderFile.new $curbuf.name.gsub(/\.cpp/, '.h')
	end
	#}}}
	#{{{
	def make_source_file
		cname = @header.class_name
		unless cname == "DEFAULT_CLASS_TEMPLATE"
			File.open("#{ENV['HOME']}/.vim/templates/template.cpp") { |tmpl|
				tmpl.each { |line|
					line.chomp!
					case line
						when /<FILENAME>/
							$curbuf.append $curbuf.count-1, line.gsub(/<FILENAME>/, cname.downcase)
						when /<YEAR>/
							$curbuf.append $curbuf.count-1, line.gsub(/<YEAR>/, Time.now.year.to_s)
						when /<DEFINE>/
							$curbuf.append $curbuf.count-1, line.gsub(/<DEFINE>/, cname.upcase)
						when /<HEADER>/
							$curbuf.append $curbuf.count-1, line.gsub(/<HEADER>/, cname.downcase)
						when /<CLASSNAME>/
							$curbuf.append $curbuf.count-1, line.gsub(/<CLASSNAME>/, cname)
						when /<TIMESTAMP>/
							$curbuf.append $curbuf.count-1, line.gsub(/<TIMESTAMP>/, Time.now.to_s)
						when /<CONSTRUCTORS>/
							@header.ctors.each { |ctor|
								$curbuf.append $curbuf.count-1, "//{{{"
								$curbuf.append $curbuf.count-1, "#{cname}::#{ctor[0]}(#{ctor[1..ctor.length].join ', '}) {"
									@header.data_members.each { |member|
										$curbuf.append $curbuf.count-1, "\t#{member[1]} = ;"
									}
								$curbuf.append $curbuf.count-1, "}"
								$curbuf.append $curbuf.count-1, "//}}}"
							}
							$curbuf.append $curbuf.count-1, "//{{{"
							$curbuf.append $curbuf.count-1, "#{cname}::~#{cname}() {"
							$curbuf.append $curbuf.count-1, "}"
							$curbuf.append $curbuf.count-1, "//}}}"
						when /<METHODS>/
							@header.methods.each { |meths|
								$curbuf.append $curbuf.count-1, "//{{{"
								$curbuf.append $curbuf.count-1, 
									"#{meths[0]} #{cname}::#{meths[1]}(#{meths[2..meths.length].join ', '}) {"
								$curbuf.append $curbuf.count-1,	"}"
								$curbuf.append $curbuf.count-1, "//}}}"
							}
						else
							$curbuf.append $curbuf.count-1, line
					end
				}
			}
		end
	end
	#}}}
end
#}}}

=begin
	change log

	$Log$
=end

# vim: set ts=4 sw=4 fdm=marker fmr={{{,}}}:
