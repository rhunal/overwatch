class Api::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found!

  protected

  def not_found!
    return api_error(status: 404, errors: 'Not found')
  end

  def api_error(status: 500, errors: [])
    unless Rails.env.production?
      puts errors.full_messages if errors.respond_to? :full_messages
    end

    render json: { 
      success: false,
      error: JSON.parse(jsonapi_format(errors).to_json)
    }, status: status
  end

  private

  #ember specific :/
  def jsonapi_format(errors)
    return errors if errors.is_a? String
    return errors if errors.is_a? Array
    errors_hash = {}
    errors.messages.each do |attribute, error|
      array_hash = []
      error.each do |e|
        array_hash << {attribute: attribute, message: e}
      end
      errors_hash.merge!({ attribute => array_hash })
    end

    return errors_hash
  end
end