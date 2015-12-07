class ProfessionsController < ApplicationController
  #require 'rufus-scheduler'
  def new
    @profession = StProfession.new
  end

  def index
    @professions = StProfession.all
    #render :text => "This is profession"
    #render :json => {:hehe => "haha"}
  end

  def show
    @profession = StProfession.find(params[:id])
    array = @profession.skills.split(",")
    temp_directory = Json_path+@profession.name+"/"
    if File::directory?(temp_directory)
      Dir.foreach(temp_directory) do |item|
        if item!='.' and item!='..'
          File.delete(temp_directory+"/"+item)
        end
      end
    else
      Dir.mkdir(Json_path+@profession.name+"/")
    end
    file = File.new(Json_path+@profession.name+"/"+@profession.name+".json","w")
    file.puts("{\"skills\": [")
    for i in 0..array.length-2
      content = StSkill.get_skill array[i]
      file.puts(JSON content)
      file.puts(",")
    end
    file.puts(JSON StSkill.get_skill array[array.length-1])
    file.puts("]}")
    file.close
    @skills_num = array.length

  end

  def create
    @profession = StProfession.new()
  end

  def status

    #render :text => "what's this"
  end

  def get_skills_json
    @profession =StProfession.find(params[:id])  #StProfession.find(params[:id])
    array = @profession.skills.split("|")
    array_skills = []
    array.each do |item|
      content = StSkill.get_skill item
      array_skills.push content
    end
    hash_skills = {"skills" => array_skills}
    render :json => Oj.dump(hash_skills)
  end

  def get_professions_json
    array = []
    StProfession.all.each do |item|
      temp_hash = {"id" => item.id,
              "name" => item.name,
              "description" => item.description
      }
      array.push(temp_hash)
    end
    professions_hash = {"professions" => array}
    render :json => Oj.dump(professions_hash)
  end
end
