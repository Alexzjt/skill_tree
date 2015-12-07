class StSkill < ActiveRecord::Base
  PATH = "/Users/zjt/RubymineProjects/skill_tree_server/public/json/"
  def self.get_skill(id)
    skill = StSkill.find_by_id(id)
    stats_arr = skill.stats.split("|")
    stats_hash = {
        "title" => stats_arr[0],
        "value" => stats_arr[1]
    }
    stats_arr2 = [].push stats_hash
    #stats_json = Oj.dump
    arr = {"id" => skill.id,
      "title" => skill.title,
      "dependsOn" => get_dependson_arr(id),
      "description" => skill.description,
      "rankDescriptions" => skill.rankDescriptions.nil? ? nil : skill.rankDescriptions.split("|"),
      "links" => get_links_arr(id),
      "maxPoints" => skill.maxPoints,
      "stats" => stats_arr2
    }
    return arr
  end

  #得到转化为正确格式的stats
  def self.get_right_stats (id)
    skill = StSkill.find_by_id(id)
    stats_arr = skill.stats.split("|")
    stats_hash = {
        "title" => stats_arr[0],
        "value" => stats_arr[1].to_i
    }
    stats_arr2 = [].push stats_hash
    return stats_arr2
  end

  #得到转化为数字数组的dependsON
  def self.get_links_arr(id)
    arr = []
    skill = StSkill.find_by_id(id)
    return arr if skill.links.nil?
    origin_arr = skill.links.split("|")
    origin_hash = {
        "label" => origin_arr[0],
        "url" => origin_arr[1]
    }
    return [].push origin_hash
  end

  #得到转化为数字数组的dependsON
  def self.get_dependson_arr (id)
    arr = []
    skill = StSkill.find_by_id(id)
    return arr if skill.dependsOn.nil?
    origin_arr = skill.dependsOn.split("|")
    origin_arr.each do |item|
      arr.push item.to_i
    end
    return arr
  end


  def self.write_json
    StSkill.all.each do |skill|
      arr = {"id" => skill.id,
             "title" => skill.title,
             "dependsOn" => skill.dependsOn,
             "description" => skill.description,
             "rankDescriptions" => skill.rankDescriptions,
             "links" => skill.links,
             "maxPoints" => skill.maxPoints,
             "stats" => skill.stats
      }
      file = File.new(PATH+skill.title+".json","w")
      file.puts(JSON arr)
      file.close
    end
  end


end
