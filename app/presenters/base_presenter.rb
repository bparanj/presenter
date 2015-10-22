class BasePresenter
  def initialize(object, template)
    @object = object
    @template = template
  end

private

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  def h
    @template
  end
  
  def markdown(text)    
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(text).html_safe
  end
  
  
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end