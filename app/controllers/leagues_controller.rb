class LeaguesController < ApplicationController
  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.order("lower(name)").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leagues }
    end
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    @league = League.find_by_id(params[:id])

    unless @league
      flash[:error] = "League not found."
      redirect_to leagues_path
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @league }
    end
  end

  # GET /leagues/new
  # GET /leagues/new.json
  def new
    @league = League.new
    @user   = User.find(session[:user_id])

    if @user.leagues_created.count >= 3
      flash.now[:warning] = "You have already created your maximum alloted number of leagues"
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @league }
    end
  end

  # GET /leagues/1/edit
  def edit
    @league = League.find_by_id(params[:id])
    @current = User.find(session[:user_id])

    unless @league
      flash[:error] = "League not found."
      redirect_to leagues_path
      return
    end

    unless @current.admin? || @league.created_by == @current
      flash[:error] = "You do not have permission to edit this league!"
      redirect_to league_path(@league)
      return
    end
  end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.new(params[:league])
    @league.created_by = User.find(session[:user_id])

    respond_to do |format|
      if @league.save
        format.html { redirect_to @league, notice: 'League was successfully created.' }
        format.json { render json: @league, status: :created, location: @league }
      else
        format.html { render action: "new" }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leagues/1
  # PUT /leagues/1.json
  def update
    @league = League.find(params[:id])

    respond_to do |format|
      if @league.update_attributes(params[:league])
        format.html { redirect_to @league, notice: 'League was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league = League.find(params[:id])
    @league.destroy

    respond_to do |format|
      format.html { redirect_to leagues_url }
      format.json { head :no_content }
    end
  end
end
