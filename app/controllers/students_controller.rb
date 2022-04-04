class StudentsController < ApplicationController

  def index
    if params[:name]
      students = Student.where("LOWER(last_name) = ?", params[:name].downcase)
      if students ==  nil
        students = Student.where("LOWER(first_name) = ?", params[:name].downcase)
      end
    else
      students = Student.all
    end 
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
