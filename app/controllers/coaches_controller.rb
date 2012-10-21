class CoachesController < ApplicationController
  
  layout :coach_layout, :except => [:new]
  
  # GET /coaches
  # GET /coaches.json
  def index
    @coaches = Coach.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coaches }
    end
  end

  # GET /coaches/1
  # GET /coaches/1.json
  def show
    @coach = Coach.find(params[:id])
    @coach_name = @coach.first_name + " " + @coach.last_name
    @lessons = []
    @time_now = DateTime.now
    view_lessons = (params[:view_lessons] && params[:view_lessons].downcase) || nil
    
    if(view_lessons == nil || view_lessons == "day")
      @lessons = @coach.lessons.where(["date >= ? AND date <= ?", @time_now.to_date, @time_now.to_date + 1]).order(:date)
    end
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coach }
    end
  end

  # GET /coaches/new
  # GET /coaches/new.json
  def new
    @coach = Coach.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coach }
    end
  end

  # GET /coaches/1/edit
  def edit
    @coach = Coach.find(params[:id])
  end

  # POST /coaches
  # POST /coaches.json
  def create
    @coach = Coach.new(params[:coach])

    respond_to do |format|
      if @coach.save
        format.html { redirect_to @coach, notice: 'Coach was successfully created.' }
        format.json { render json: @coach, status: :created, location: @coach }
      else
        format.html { render action: "new" }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coaches/1
  # PUT /coaches/1.json
  def update
    @coach = Coach.find(params[:id])

    respond_to do |format|
      if @coach.update_attributes(params[:coach])
        format.html { redirect_to @coach, notice: 'Coach was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coaches/1
  # DELETE /coaches/1.json
  def destroy
    @coach = Coach.find(params[:id])
    @coach.destroy

    respond_to do |format|
      format.html { redirect_to coaches_url }
      format.json { head :no_content }
    end
  end
  
  def new_lesson
    @coach = Coach.find(params[:id])
    
    respond_to do |format|
      format.html 
      format.json { render json: @coach }
    end
  end
  
  private
    def coach_layout
      @coach.nil? ? "application" : "coach"
    end
end
