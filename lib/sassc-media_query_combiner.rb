require "sassc/media_query_combiner/version"
require "sassc/media_query_combiner/combiner"
require "sassc"

SassC::Engine.class_eval do
  def render_with_combine
    SassC::MediaQueryCombiner::Combiner.combine(render_without_combine)
  end
  alias_method :render_without_combine, :render
  alias_method :render, :render_with_combine
  alias_method :to_css, :render_with_combine
end
