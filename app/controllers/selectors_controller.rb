class SelectorsController < ApplicationController
  include FoldableItemController

  before_action :set_selector, only: [:show, :edit, :update, :destroy]

  # GET /selectors
  # GET /selectors.json
  def index
    @selectors = Selector.all
  end

  # GET /selectors/new
  def new
    @selector = Selector.new(folder: @parent_folder)
  end

  # GET /selectors/1/edit
  def edit
  end

  # POST /selectors
  # POST /selectors.json
  def create
    @selector = Selector.new(selector_params.merge(folder: @parent_folder))

    respond_to do |format|
      if @selector.save
        format.html { redirect_to @selector, notice: 'Selector was successfully created.' }
        format.json { render :show, status: :created, location: @selector }
      else
        format.html { render :new }
        format.json { render json: @selector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selectors/1
  # PATCH/PUT /selectors/1.json
  def update
    respond_to do |format|
      if @selector.update(selector_params)
        format.html { redirect_to @selector, notice: 'Selector was successfully updated.' }
        format.json { render :show, status: :ok, location: @selector }
      else
        format.html { render :edit }
        format.json { render json: @selector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selectors/1
  # DELETE /selectors/1.json
  def destroy
    @selector.destroy
    respond_to do |format|
      format.html { redirect_to selectors_url, notice: 'Selector was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selector
      @selector = Selector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selector_params
      params.require(:selector).permit(:slug, :name, :tags)
    end
end
