module IFlash

  def i_flash_auto(result = :notice, *args)
    i_path = "actions.all.#{params[:action]}.#{result.to_s}"
    object = params[:controller].singularize.titlecase
    flash[message_type(result)] = t(i_path, :object => object)
  end

  def i_flash(result = :notice, *args)
    i_path = "actions.#{params[:controller]}.#{params[:action]}.#{result.to_s}"
    flash[message_type(result)] = t(i_path, *args)
  end

  def i_flash_for(condition = true, *args)
    condition ? i_flash(:success, *args) : i_flash(:failure, *args)
  end

protected

  def message_type(result)
    case result
    when :failure then :alert
    when :error then :alert
    else :notice
    end
  end
  
end

ActionController::Base.send :include, IFlash
I18n.load_path << File.join(File.dirname(__FILE__), 'locale', 'en.yml')

