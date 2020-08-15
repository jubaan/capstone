module UsersHelper
  def user_name
    name = current_user.name.downcase.capitalize
    name.length > 7 ? 'Welcome' : "Hi, #{name}!"
  end

  def total_expenses_current_user_for_dashboard
    sum = 0
    current_user.expenses.ordered_expenses_by_most_recent.each { |e| sum += e.amount }
    number_to_currency(sum)
  end

  def total_expenses_current_user_for_groups
    sum = 0
    current_user.expenses.g_ordered_expenses_by_most_recent.each { |e| sum += e.amount }
    number_to_currency(sum)
  end

  def total_expenses_current_user
    sum = 0
    current_user.expenses.grouped_ordered_expenses_by_most_recent.each { |e| sum += e.amount }
    number_to_currency(sum)
  end

  def total_group_current_user(group)
    current_user.expenses.where(group: group).sum(:amount)
  end

  # rubocop:disable Layout/LineLength
  # rubocop:disable Lint/UselessAssignment
  def show_user_profile_image
    if current_user.image.url.nil?
      render html:
               "<img src='https://lh3.googleusercontent.com/proxy/MaQ13mtUV2sn51l6Q2KFSKpWx3D2-XlQ57V4m11F3AnldwodNbucAZs74mzxzqEOAooj19CgqN3KE7RQj7v4vnPBy2TDiCqkYZ0ccRIJWuhk0w4weVvnNHtG05phd3jte6WpVhKfLo14foFt6t8A' class='rounded-circle mr-3 border' width= '150px' height= '150px'>"
                 .html_safe
    else
      render = image_tag current_user.image.url, width: '150px', height: '150px', class: 'rounded-circle mr-3'
    end
  end

  # rubocop:enable Layout/LineLength
  # rubocop:enable Lint/UselessAssignment
end
