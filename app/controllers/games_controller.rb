class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @games = Game.where("runner_user_id = #{@user.id} or corporation_user_id = #{@user.id}")
    elsif params[:league_id]
      @league = League.find(params[:league_id])
      @games = Game.where("league_id = #{@league.id}")
    elsif params[:match_id]
      @match = Match.find(params[:match_id])
      @games = Game.where("match_id = #{@match.id}")
    else
      @games = Game
    end

    @games = @games.order('date desc').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find_by_id(params[:id])

    unless @game
      flash[:error] = "Game not found."
      redirect_to games_path
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    @corporations = Corporation.order(:faction, :slogan)
    @runners = Runner.order(:faction, :name)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find_by_id(params[:id])
    @current = User.find(session[:user_id])

    unless @game
      flash[:error] = "Game not found."
      redirect_to games_path
      return
    end

    unless @current.admin? || @current == @game.runner_user || @current == @game.corporation_user
      flash[:error] = "You do not have permission to edit this game!"
      redirect_to game_path(@game)
      return
    end

    @corporations = Corporation.order(:faction, :slogan)
    @runners = Runner.order(:faction, :name)
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])
    @corporations = Corporation.order(:faction, :slogan)
    @runners = Runner.order(:faction, :name)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])
    @corporations = Corporation.order(:faction, :slogan)
    @runners = Runner.order(:faction, :name)

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
end
