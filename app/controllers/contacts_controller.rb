class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    #render('contacts/index.html.erb')
    respond_to do |format|
      format.html
      format.json { render :json => @contacts }
    end
  end

  def new
    @contact = Contact.new
    render('contacts/new.html.erb')
  end

  def show
    @contact = Contact.find(params[:id])
    #render('contacts/show.html.erb')
    respond_to do |format|
      format.html
      format.json { render :json => @contact }
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    render('contacts/edit.html.erb')
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    #render('contacts/destroy.html.erb')
    respond_to do |format|
      format.html do
        flash[:notice] = "Contact deleted."
        redirect_to contacts_path
      end
      format.json { head :no_content }
    end
  end

  def create
    @contact = Contact.create(:name => params[:name],
                              :email => params[:email],
                              :phone => params[:phone])
    if @contact.save
      #render('contacts/success.html.erb')
      respond_to do |format|
        format.html do
          flash[:notice] = "Contact created."
          redirect_to contacts_path
        end
        format.json { render :json => @contact, :status => 201 }
      end
    else
      #render('contacts/new.html.erb')
      respond_to do |format|
        format.html { render 'new' }
        format.json { render :json => @contact.errors, :status => 422 }
      end
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(:name => params[:name],
                       :email => params[:email],
                       :phone => params[:phone])
      #render('contacts/success.html.erb')
      respond_to do |format|
        format.html do
          flash[:notice] = "Contact updated."
          redirect_to contact_path(@contact)
        end
        format.json { head :no_content }
      end
    else
      #render('contacts/edit.html.erb')
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render :json => @contact.errors, :status => 422 }
      end
    end
  end
end
