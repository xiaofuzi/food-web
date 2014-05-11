module ApplicationHelper

	def full_title(page_title)                          # 方法定义
    base_title = "Delicious foods |"  # 变量赋值
    if page_title.empty?                              # 布尔测试
      base_title                                      # 非显式返回值
    else
      "#{base_title} | #{page_title}"                 # 字符串插值
    end
    end

    def user_is_admin(user)
    	if user.id < 2
    		return true
    	else
    		return false
    	end
    end
end
