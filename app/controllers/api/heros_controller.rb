class Api::HerosController < Api::BaseController

  before_action :set_hero, only: [:show, :abilities]

  def index
    heros = Hero.all

    render(
      json: { 
        success: true,
        data: heros.map{|m| Api::HeroSerializer.new(m, root: false) },
        errors: []
      },
      status: 201
    )
  end

  def show
    render(
      json: {
        success: true,
        data: Api::HeroSerializer.new(@hero, root: false),
        errors: []
      },
      status: 201
    )
  end

  def abilities
    render(
      json: {
        success: true,
        data: @hero.abilities.map{|m| Api::AbilitySerializer.new(m, root: false) },
        errors: []
      },
      status: 201
    )
  end

  private
    def set_hero
      @hero = Hero.find(params[:id])
    end
end