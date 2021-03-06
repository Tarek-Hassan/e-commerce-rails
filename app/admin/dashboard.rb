ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      # column do
      #   panel "Recent Posts" do
      #     ul do
      #       Post.recent(5).map do |post|
      #         li link_to(post.title, admin_post_path(post))
      #       end
      #     end
      #   end
      # end
      column do
        panel "Products" do
          ul do
            Product.all.map do |p|
              li p.title
              # Store.where(admin_user_id: p.admin_user_id).map do |s|
              li p.admin_user_id ? (Store.where(admin_user_id: p.admin_user_id)).inspect : ""
                # li p.user_id ? s.name : "no name"
              # end
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Users Emails:"
          ul do
            User.all.map do |user|
              li user.seller ? "#{user.email} is SELLER" : "#{user.email} is a BUYER"
            end
          end
        end
      end
      
    end
  end # content
end
