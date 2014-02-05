#!/usr/bin/ruby

require 'tempfile'
require 'uri'
require 'net/http'
require 'json'

# create temporary file
f = Tempfile.new("oakenshield")

begin
	# write update file in vim
	system("vim", f.path)

		# open update file into variable ud (update).
		#File.open(f.path) do|file|
		$update = IO.read(f.path)
			#file.readlines

		uri = URI.parse('https://oak.elephly.net/api/v1/posts/create?token=PutYourAPITokenHere')
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		post = Net::HTTP::Post.new(uri.request_uri)
		post.set_form_data({'text' => $update, 'source' => 'thorin.rb'})
		response = http.request(post)
		data = response.body
		result = JSON.parse(data)

		puts result

#end

	ensure
	f.close!
end

