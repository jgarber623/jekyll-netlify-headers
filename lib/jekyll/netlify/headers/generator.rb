require 'jekyll'

module Jekyll
  module Netlify
    module Headers
      class Generator < Jekyll::Generator
        safe true
        priority :low

        def generate(site)
          headers = site.config['netlify'] && site.config['netlify']['headers']

          raise 'No Netlify headers found in Jekyll configuration file(s)!' unless headers

          page = PageWithoutAFile.new(site, __dir__, '', '_headers')
          page.content = page_content(headers)

          site.pages << page
        end

        private

        def page_content(headers)
          content = []

          headers.each do |hash|
            mapped_headers = hash['headers'].map { |header| "  #{header}" }

            hash['paths'].each do |path|
              content << path
              content << mapped_headers
            end
          end

          content.join("\n")
        end
      end
    end
  end
end
