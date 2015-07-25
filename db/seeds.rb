# coding: utf-8

# 默认配置项
# 如需新增设置项，请在这里初始化默认值，然后到后台修改
# 首页
# SiteConfig.index_html

# SiteConfig.delete_all

# SiteConfig.save_default("index_html",<<-eos
# <div class="box" style="text-align:center;">
#   <p><img alt="Big_logo" src="/assets/big_logo.png"></p>
# </div>
# eos
# )

# # Wiki 首页 HTML
# SiteConfig.save_default("wiki_index_html",<<-eos
# <div class="box">
#   Wiki Home page.
# </div>
# eos
# )

# # Footer HTML
# SiteConfig.save_default("footer_html",<<-eos
# <p class="copyright">
#  &copy; China Group.
# </p>
# eos
# )

# SiteConfig.save_default("style_url", "/css/style_white.css")

# SiteConfig.save_default("about_cn", "关于")
# SiteConfig.save_default("about_en", "about")

# SiteConfig.save_default("about_cn", "公司简介中文版")
# SiteConfig.save_default("about_en", "about us English")
# SiteConfig.save_default("contact_cn", "联系信息")
# SiteConfig.save_default("contact_en", "contact info")
# SiteConfig.save_default("site_logo","logo.png")
# SiteConfig.save_default("site_slogan","SLOGAN")

# Picture.delete_all
# Picture.create(key: "about_image", value: "about_image")
# Picture.create(key: "news_image")
# Picture.create(key: "activity_image")


# Partner.delete_all
# Partner.create(name: "Google", url: "http://www.google.com")
# Partner.create(name: "Baidu", url: "http://www.baidu.com")
# Partner.create(name: "Bing", url: "http://www.bing.com")

Service.delete_all
Service.create(title: "Service1", content: "Service1")
Service.create(title: "Service2", content: "Service2")
Service.create(title: "Service3", content: "Service3")
Service.create(title: "Service4", content: "Service4")
Service.create(title: "Service5", content: "Service5")

