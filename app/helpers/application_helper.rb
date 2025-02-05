module ApplicationHelper
  # Хелпер для получения текущего года
  def current_year
    Time.now.year
  end

  # Хелпер для вывода ссылки на GitHub-репозиторий проекта
  def github_link
    link_to "Проект на GitHub", "https://github.com/yourusername/your-repo", target: "_blank"
  end
  def flash_messages
    flash.map do |key, message|
      # Определяем CSS-класс для типа сообщения
      css_class = case key.to_sym
                  when :notice then "alert alert-success"
                  when :alert then "alert alert-danger"
                  else "alert alert-info"
                  end

      # Создаем HTML для сообщения
      content_tag(:div, message, class: css_class)
    end.join.html_safe
  end
end
