class Api::AbilitiesController < Api::BaseController

  before_action :set_ability, only: [:show]

  def index
    abilities = Ability.all

    render(
      json: { 
        success: true,
        data: abilities.map{|m| Api::AbilitySerializer.new(m, root: false) },
        errors: []
      },
      status: 201
    )
  end

  def show
    render(
      json: {
        success: true,
        data: Api::AbilitySerializer.new(@ability, root: false),
        errors: []
      },
      status: 201
    )
  end

  private
    def set_ability
      @ability = Ability.find(params[:id])
    end
end