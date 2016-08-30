module ApplicationHelper

    def flash_message type, text
       flash[type] ||= []
       flash[type] << text
    end
    
    def render_flash
       flash_array = []
       flash.each do |type, messages|
          if messages.is_a?(String)
             flash_array << render(partial: 'shared/flash',
             locals: { :type => type, :message => messages })
          else
            messages.each do |m|
              flash_array << render(partial: 'shared/flash',
              locals: { :type => type, :message => m }) unless m.blank?
            end
          end
       end
       flash_array.join('').html_safe
    end

    def title(page_title)
      content_for(:title) { page_title }  
    end

    def meta_tag(tag, text)
      content_for :"meta_#{tag}", text
    end

    def yield_meta_tag(tag, default_text='')
      content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
    end

end
