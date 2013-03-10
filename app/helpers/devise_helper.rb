module DeviseHelper

  def after_sign_in_path_for( resource )
    notifications_path
  end

  def after_sign_up_path_for( resource )
    notifications_path
  end

end
