module GroupsHelper
  def groups_by_most_recent
    current_user.groups.ordered_groups_by_most_recent.to_set
  end

  def show_group_selection(f)
    render =
      f.input :group_id,
              collection: Group.all, selected: 1, include_blank: false
  end

  def show_group_icon(e)
    if e.group.icon.url
      render = image_tag e.group.icon.url, class: 'icon-expense'
    end
  end

  def show_edit_button(group)
    unless group.id == 1
      render =
        link_to edit_group_path(group), class: 'text-muted' do
          Edit
          '%i.fas.fa-edit'
        end
    end
  end
end
