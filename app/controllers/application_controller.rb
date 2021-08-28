class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]

  before_action :set_locale

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id)

  end


  # ＝＝＝＝＝言語を動的に切り替える処理＝＝＝＝＝＝
  def set_locale
    I18n.locale = locale
  end

  def locale
    @locale ||= params[:locale] ||= I18n.default_locale
  end

  def default_url_options(options={})
    options.merge(locale: locale)
  end
  # ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

  end
end
