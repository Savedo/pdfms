class StacksController < ContentController
  include FoldableItemController

  before_action :set_stack, only: [:show, :edit, :update, :destroy]

  # GET /stacks
  # GET /stacks.json
  def index
    @stacks = Stack.all
  end

  # GET /stacks/new
  def new
    @stack = Stack.new(folder: @parent_folder)
  end

  # GET /stacks/1/edit
  def edit
  end

  # POST /stacks
  # POST /stacks.json
  def create
    @stack = Stack.new(stack_params.merge(folder: @parent_folder))

    respond_to do |format|
      if @stack.save
        format.html { redirect_to @stack, notice: 'Stack was successfully created.' }
        format.js { render :show, notice: 'Stack was successfully created.' }
        format.json { render :show, status: :created, location: @stack }
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stacks/1
  # PATCH/PUT /stacks/1.json
  def update
    respond_to do |format|
      if @stack.update(stack_params)
        format.html { redirect_to @stack, notice: 'Stack was successfully updated.' }
        format.js { render :show, notice: 'Stack was successfully updated.' }
        format.json { render :show, status: :ok, location: @stack }
      else
        format.html { render :edit }
        format.js { render :edit }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stacks/1
  # DELETE /stacks/1.json
  def destroy
    @stack.destroy
    respond_to do |format|
      format.html { redirect_to stacks_url, notice: 'Stack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stack
      @stack = Stack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stack_params
      params.require(:stack).permit(:slug, :name, :tags)
    end
end
