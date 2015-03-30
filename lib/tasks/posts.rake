require 'instagram'

namespace :posts do
  desc "Rake task to fetch photos from Instagram"
  task :fetch => :environment do
    Instagram.user_recent_media(1444174065).reverse.each do |item|
      if Post.find_by_instagram_link(item.link)
        break
      else
        Post.create(subject: "Image From Instagram", instagram_link: item.link)
      end
    end
  end
end
