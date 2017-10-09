module Trestle
  module PanelHelper

    def panels
      @_trestle_panels ||= {}
    end

    def panel(name, options={})
      panels[name] = Panel.new(name, options)

      content_tag(:div, class: ["panel panel-#{options[:class]||"default"}"]) do
        concat content_tag(:div, name, class: 'panel-heading')
        concat content_tag(:div, (block_given? ? yield : render(partial: options[:partial]||name.to_s)), class: 'panel-body')
        concat content_tag(:div, options[:footer].try(:html_safe), class: 'panel-footer')
      end
    end
  end
end
