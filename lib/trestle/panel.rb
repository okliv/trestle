module Trestle
  class Panel
    include ActionView::Helpers::PanelHelper

    attr_reader :name, :options

    def initialize(name, options={})
      @name, @options = name, options
    end

    def label
      safe_join([options[:label] || I18n.t("admin.tabs.#{name}", default: name.to_s.titleize), badge].compact, " ")
    end

    def badge
      content_tag(:span, options[:badge], class: "badge") if options[:badge]
    end
  end
end
