class TemplatesController < ApplicationController
  include FoldableItemController

  before_action :set_template, only: [:show, :edit, :update, :destroy, :pdf, :source]

  # GET /templates
  # GET /templates.json
  def index
    @templates = Template.all
  end

  def pdf
    redirect_to @template.pdf.url
  end

  def source
    redirect_to @template.source.url
  end


  # GET /templates/new
  def new
    @template = Template.new(folder: @parent_folder)
  end

  # GET /templates/1/edit
  def edit
  end

  # POST /templates
  # POST /templates.json
  def create
    @template = Template.new(template_params.merge(folder: @parent_folder))

    respond_to do |format|
      if @template.save
        format.html { redirect_to @template, notice: 'Template was successfully created.' }
        format.js {  render :show, notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
        format.js { render :show, notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.js { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1per
  # DELETE /templates/1.json
  def destroy
    folder = @template.folder
    @template.destroy
    respond_to do |format|
      format.html { redirect_to folder || root_path, notice: 'Template was successfully destroyed.' }
      format.js { render partial: 'folder', locals: { folder: folder }, notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:slug, :name, :tags, :pdf, :source)
    end
end
