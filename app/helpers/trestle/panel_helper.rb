module Trestle
  module PanelHelper
    def panels
      @_trestle_panels ||= {}
    end

    def panel(name, options={})
      tabs[name] = Panel.new(name, options)

      content_tag(:div, class: ["panel panel-default"]) do
        content_tag(:div, name, class: 'panel-heading')
        content_tag(:div, class: 'panel-body') do
          if block_given?
            yield
          elsif options[:partial]
            render partial: options[:partial]
          else
            render partial: name.to_s
          end
        end
        content_tag(:div, class: 'panel-footer') do

        end
      end
    end
  end
end
