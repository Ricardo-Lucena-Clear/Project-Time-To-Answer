class AdminsBackoffice::SubjectsController < AdminsBackofficeController
    before_action :set_subject, only: [:edit, :update, :destroy]
    def index
      @admins = Subject.all.page params[:page]
    end
  
    def new
      @subjects = Subject.new
    end
  
    def create
      @subject = Subject.new(params_subject)
      if @subject.save
         redirect_to admins_backoffice_subjects_path, notice: "Assunto/Area cadastrado com sucesso!"
      else
         render :new
    end
    end
  
    def edit
    end
  
    def destroy
      if @subject.destroy
      redirect_to admins_backoffice_subjects_path, notice: "Assunto/Area excluído com sucesso!"
      else
      render :index
      end
      end
  
    def update
      if @subject.update(params_subject)
        redirect_to admins_backoffice_subjects_path, notice: "Assunto/Area atualizado com sucesso!"
      else  
        render :edit
      end
    end
  
    private
  
    def params_subject
      params.require(:subject).permit(:description)
      end
  
    def set_subject
      @subject = Admin.find(params[:id])
      end
   end
  