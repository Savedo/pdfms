class VersionsController < ApplicationController
  before_action :set_template, only: [:index, :new, :create]
  before_action :set_version, only: [:show, :edit, :update, :destroy, :pdf, :in_design]

  # GET /versions
  # GET /versions.json
  def index
    @versions = @template.versions
  end

  # GET /versions/1/pdf
  def pdf
    redirect_to @version.pdf_template.url
  end

  # GET /versions/1/pdf
  def in_design
    redirect_to @version.in_design_source.url
  end

  # GET /versions
  # GET /versions.json
  def index
    @versions = @template.versions
  end

  # GET /versions/1
  # GET /versions/1.json
  def show
  end

  # GET /versions/new
  def new
    @version = Version.new(template: @template)
  end

  # GET /versions/1/edit
  def edit
  end

  # POST /versions
  # POST /versions.json
  def create
    @version = Version.new(version_params.merge(template: @template))

    respond_to do |format|
      if @version.save
        format.html { redirect_to @template, notice: 'Version was successfully created.' }
        format.json { render :show, status: :created, location: @version }
      else
        format.html { render :new }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /versions/1
  # PATCH/PUT /versions/1.json
  def update
    respond_to do |format|
      if @version.update(version_params)
        format.html { redirect_to @version.template, notice: 'Version was successfully updated.' }
        format.json { render :show, status: :ok, location: @version }
      else
        format.html { render :edit }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /versions/1
  # DELETE /versions/1.json
  def destroy
    @template = @version.template
    @version.destroy
    respond_to do |format|
      format.html { redirect_to @template, notice: 'Version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_template
      @template = Template.find_by(slug: params[:template_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_version
      @version = Version.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def version_params
      params.require(:version).permit(:description, :pdf_template, :in_design_source)
    end
end
