module Trestle
  module PanelHelper
<<<<<<< HEAD

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
=======
    def panel(options={}, &block)
      html_class = options.fetch(:class) { "panel-default" }

      content_tag(:div, class: ["panel", html_class]) do
        if options[:title]
          concat content_tag(:div, options[:title], class: "panel-heading")
        end

        concat content_tag(:div, class: "panel-body", &block)

        if options[:footer]
          concat content_tag(:div, options[:footer], class: "panel-footer")
        end
      end
    end

    def well(options={}, &block)
      html_class = ["well", options[:class]].compact
      content_tag(:div, options.merge(class: html_class), &block)
    end
>>>>>>> pr/3
  end
end
