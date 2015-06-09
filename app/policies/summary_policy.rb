class SummaryPolicy < ApplicationPolicy
  
  def create
    true
  end
  
  def show
    create?
  end
  
end