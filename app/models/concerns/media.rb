module Media
  extend ActiveSupport::Concern

  def url!(object)
    url_for(object) if object.attached?
  end
end
