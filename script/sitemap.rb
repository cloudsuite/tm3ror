require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = "http://localhost:3000"
SitemapGenerator::Sitemap.create do
	add '/home', :changefreq => 'weekly', :priority => 0.8
	Product.find_each do |product|
		add product_path(product), :lastmod => product.updated_at
	end
		
end
