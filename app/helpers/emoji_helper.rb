module EmojiHelper
  def emojify(content)
    h(content).to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
      else
        match
      end
    end.html_safe if content.present?
  end

  def nicolify(content)
    content = emojify(content)

    #code blocks
    content = h(content).to_str.gsub(/```([\s\S]*)```/) do |match|
      %(<code>#{$1}</code>)
    end.html_safe if content.present?

    #new lines
    content = h(content).to_str.gsub(/\n/) do |match|
      %(<br>)
    end.html_safe if content.present?

    #bold
    content = h(content).to_str.gsub(/\*\*([\s\S]*)\*\*/) do |match|
      %(<b>#{$1}</b>)
    end.html_safe if content.present?

    #italic
    content = h(content).to_str.gsub(/\*([\s\S]*)\*/) do |match|
      %(<i>#{$1}</i>)
    end.html_safe if content.present?
  end
end
