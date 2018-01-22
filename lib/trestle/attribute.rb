module Trestle
  class Attribute
    attr_reader :name, :type, :options

    def initialize(name, type, options={})
      @name, @type, @options = name.to_sym, type, options
    end

<<<<<<< HEAD
    def association?
      type == :association
    end

    def boolean?
      type == :boolean
    end

    def text?
      type == :text
    end

    def datetime?
      [:datetime, :time, :date].include?(type)
    end

    def primary_key?
      name.to_s == admin.model.primary_key.to_s
    end

    def inheritance_column?
      name.to_s == admin.model.try(:inheritance_column)
    end

    def counter_cache?
      name.to_s.end_with?("_count")
=======
    def array?
      options[:array] == true
>>>>>>> pr/3
    end

    class Association < Attribute
      def initialize(name, options={})
        super(name, :association, options)
      end

      def association_name
        options[:name] || name.to_s.sub(/_id$/, "")
      end

      def association_class
        options[:class].respond_to?(:call) ? options[:class].call : options[:class]
      end

      def polymorphic?
        options[:polymorphic] == true
      end
    end
  end
end
