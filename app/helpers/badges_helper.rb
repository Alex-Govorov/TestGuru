module BadgesHelper
  def badges_count(badge)
    current_user.badges.count_by_id(badge)
  end
end
