class HomeController < ApplicationController
  before_action :student_sign_up

  def index  
    @comuna = params[:commune]
    @region = params[:region]

    if @comuna.nil?      
      @comuna = ""      
    end  
    if @region.nil?
      @region = ""  
    end 
    @mensaje = "Publicaciones de la comuna de " + @comuna
    if @comuna.empty?
      @mensaje = "Publicaciones de " + @region
    end  
    if @region.empty?
      @mensaje = ""
    end

    if !@comuna.empty?
      @posts = Post.select("students.name, students.lastname, students.university, students.region, students.commune, students.email, students.career, students.year,students.phono, students.profile_image, students.cover_photo, posts.title, posts.body, posts.id, posts.student_id, posts.created_at").joins("INNER JOIN students ON posts.student_id = students.id").where("commune = '#{@comuna}' AND region = '#{@region}'").order(id: :desc)                    
    else
      if !@region.empty?
        @posts = Post.select("students.name, students.lastname, students.university, students.region, students.commune, students.email, students.career, students.year,students.phono, students.profile_image, students.cover_photo, posts.title, posts.body, posts.id, posts.student_id, posts.created_at").joins("INNER JOIN students ON posts.student_id = students.id").where("region = '#{@region}'").order(id: :desc)
      else        
        @posts = Post.select("students.name, students.lastname, students.university, students.region, students.commune, students.email, students.career, students.year,students.phono, students.profile_image, students.cover_photo, posts.title, posts.body, posts.id, posts.student_id, posts.created_at").joins("INNER JOIN students ON posts.student_id = students.id").order(id: :desc)
      end 
    end
  end

  def student_sign_up
    if student_signed_in?
      if current_student.name.nil?
        redirect_to  edit_student_path(current_student.id)
      end 
    end
  end
end