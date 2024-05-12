# frozen_string_literal: true

class Users::Shops::BuyResources
  include Interactor::Initializer

  initialize_with :user, :params

  def run
    case params[:resource_type]
    when 'health'
      buy_health
    when 'experience_points'
      buy_experience_points
    else
      raise Errors::InvalidOperation, 'Invalid resource type'
    end

    user
  end

  private

  def buy_health
    raise_max_health_error if user.health == 5
    raise_not_enough_money_error unless user.money >= 100

    user.subtract_money(100)
    user.add_health
  end

  def raise_max_health_error
    raise Errors::InvalidOperation, 'Health is already at maximum'
  end

  def buy_experience_points
    raise_not_enough_money_error unless user.money >= 100

    user.subtract_money(100)
    user.update(experience_points: user.experience_points + 100)
  end

  def raise_not_enough_money_error
    raise Errors::InvalidOperation, 'Not enough money'
  end
end
