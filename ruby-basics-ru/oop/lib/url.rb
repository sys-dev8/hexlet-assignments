# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  include Comparable
  extend Forwardable

  attr_accessor :uri, :params

  def initialize(uri)
    @uri = URI(uri)
    @params = {}
  end

  def_delegators :@uri, :scheme, :host, :port

  def query_params
    create_params
  end

  def query_param(key, value = nil)
    @params[key] ||= value
  end

  def <=>(other)
    [scheme, host, port, query_params] <=> [other.scheme, other.host, other.port, other.query_params]
  end

  private

  def create_params
    return @params if @uri.query.nil?

    @params = URI.decode_www_form(@uri.query).to_h.transform_keys { |key| key.to_sym }
  end
end
# END
