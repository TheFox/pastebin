
require 'net/http'
require 'uri'

module TheFox
	module Pastebin
		
		class Pastebin
			
			API_LOGIN_URI = URI.parse('https://pastebin.com/api/api_login.php')
			API_POST_URI = URI.parse('https://pastebin.com/api/api_post.php')
			API_RAW_URI = URI.parse('https://pastebin.com/raw/')
			
			API_DEV_KEY = 'd46f57321035e4a1eba3ce9b1a70d3cd'
			
			def initialize(options = Hash.new)
				@options = options
				@options['api_dev_key'] ||= API_DEV_KEY
				@options['api_paste_expire_date'] ||= 'N'
				@options['api_paste_private'] ||= '0'
				@name_prefix = @options['name_prefix'] || ''
				@name_postfix = @options['name_postfix'] || ''
				
				if @options.has_key?('api_paste_name') && @options['api_paste_name'] != '' && (@name_prefix != '' || @name_postfix != '')
					@options['api_paste_name'] = "#{@name_prefix}#{@options['api_paste_name']}#{@name_postfix}"
				end
			end
			
			def login(username, password)
				@options['api_user_name'] = username
				@options['api_user_password'] = password
				
				res = Net::HTTP.post_form(API_LOGIN_URI, @options)
				
				if res.code.to_i == 200 && /^[a-f0-9]{32}$/.match(res.body)
					return res.body
				end
				
				raise res.body
			end
			
			def paste
				@options['api_option'] = 'paste'
				
				if @options['api_paste_code']
					if @options['api_paste_code'].to_s == '-'
						@options['api_paste_code'] = STDIN.read
					else
						File.open(@options['api_paste_code']) do |file|
							@options['api_paste_code'] = file.read
						end
					end
				else
					@options['api_paste_code'] = STDIN.read
				end
				
				if @options['api_paste_code']
					return Net::HTTP.post_form(API_POST_URI, @options).body
				end
				
				raise 'no code to paste'
			end
			
			def raw(id)
				uri = API_RAW_URI.clone
				# uri.query = "i=#{id}"
				uri.path << id.to_s
				
			    Net::HTTP.get_response(uri).body
			end
			
			def print_skel
				puts "API_DEV_KEY=#{API_DEV_KEY}"
				puts 'API_USER_KEY='
				puts 'API_PASTE_EXPIRE_DATE=n'
				puts 'API_PASTE_FORMAT='
				puts 'API_PASTE_PRIVATE=2'
				puts 'NAME_PREFIX='
				puts 'NAME_POSTFIX='
			end
			
			def print_defaults
				puts "API_DEV_KEY=#{@options['api_dev_key']}"
				puts "API_USER_KEY=#{@options['api_user_key']}"
				puts "API_PASTE_EXPIRE_DATE=#{@options['api_paste_expire_date']}"
				puts "API_PASTE_FORMAT=#{@options['api_paste_format']}"
				puts "API_PASTE_PRIVATE=#{@options['api_paste_private']}"
				puts "NAME_PREFIX=#{@name_prefix}"
				puts "NAME_POSTFIX=#{@name_postfix}"
			end
		end
		
	end
end
