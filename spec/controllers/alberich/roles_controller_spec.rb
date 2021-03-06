require 'spec_helper'

module Alberich
  describe RolesController do

    before(:each) do
      @role = FactoryGirl.create(:role)
      @admin_permission = FactoryGirl.create(:admin_permission)
      @admin = @admin_permission.user
      mock_warden(@admin)
    end

    describe "GET index" do
      it "assigns all roles as @roles" do
        get :index, {}
        assigns(:roles).should include(@role)
      end
    end

    describe "GET show" do
      it "assigns the requested role as @role" do
        get :show, {:id => @role.to_param}
        assigns(:role).should eq(@role)
      end
    end

    describe "GET new" do
      it "assigns a new role as @role" do
        get :new, {}
        assigns(:role).should be_a_new(Role)
      end
    end

    describe "GET edit" do
      it "assigns the requested role as @role" do
        get :edit, {:id => @role.to_param}
        assigns(:role).should eq(@role)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Role" do
          expect {
            post :create, {:role => FactoryGirl.attributes_for(:role).symbolize_keys}
          }.to change(Role, :count).by(1)
        end

        it "assigns a newly created role as @role" do
          post :create, {:role => FactoryGirl.attributes_for(:role).symbolize_keys}
          assigns(:role).should be_a(Role)
          assigns(:role).should be_persisted
        end

        it "redirects to the created role" do
          post :create, {:role => FactoryGirl.attributes_for(:role).symbolize_keys}
          response.should redirect_to(Role.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved role as @role" do
          # Trigger the behavior that occurs when invalid params are submitted
          Role.any_instance.stub(:save).and_return(false)
          post :create, {:role => {}}
          assigns(:role).should be_a_new(Role)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Role.any_instance.stub(:save).and_return(false)
          post :create, {:role => {}}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested role" do
          # Assuming there are no other roles in the database, this
          # specifies that the Role created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Role.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, {:id => @role.to_param, :role => {'these' => 'params'}}
        end

        it "assigns the requested role as @role" do
          put :update, {:id => @role.to_param, :role => FactoryGirl.attributes_for(:role).symbolize_keys}
          assigns(:role).should eq(@role)
        end

        it "redirects to the role" do
          put :update, {:id => @role.to_param, :role => FactoryGirl.attributes_for(:role).symbolize_keys}
          response.should redirect_to(@role)
        end
      end

      describe "with invalid params" do
        it "assigns the role as @role" do
          # Trigger the behavior that occurs when invalid params are submitted
          Role.any_instance.stub(:save).and_return(false)
          put :update, {:id => @role.to_param, :role => {}}
          assigns(:role).should eq(@role)
        end

        it "re-renders the 'edit' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Role.any_instance.stub(:save).and_return(false)
          put :update, {:id => @role.to_param, :role => {}}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested role" do
        expect {
          delete :destroy, {:id => @role.to_param}
        }.to change(Role, :count).by(-1)
      end

      it "redirects to the roles list" do
        delete :destroy, {:id => @role.to_param}
        response.should redirect_to(roles_path)
      end
    end
  end
end
