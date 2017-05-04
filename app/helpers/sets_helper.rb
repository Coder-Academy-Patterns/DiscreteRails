module SetsHelper
  def link_to_set(title, set)
    link_to_unless_current title, sets_path(items: set.sort_by(&:to_i).join('~'))
  end
end
