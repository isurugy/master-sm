module ApplicationHelper
  def resource_name
    :usr_contact
  end

  def resource
    @resource ||= UsrContact.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:usr_contact]
  end
end
