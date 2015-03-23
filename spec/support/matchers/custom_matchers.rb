RSpec::Matchers.define :have_emoji do |e|
  match do |page|
    emoji = Emoji.find_by_alias(e)
    has_xpath?("//img[@src=\"/images/emoji/#{emoji.image_filename}\"]")
  end

  failure_message do
    "#{e} emoji not found"
  end
end
