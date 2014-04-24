module ApplicationHelper

	def full_title(page_title)                          # 方法定义
    base_title = "the beatiful dangces |"  # 变量赋值
    if page_title.empty?                              # 布尔测试
      base_title                                      # 非显式返回值
    else
      "#{base_title} | #{page_title}"                 # 字符串插值
    end
  end
end
