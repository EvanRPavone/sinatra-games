class UsersController < ApplicationController
    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'/users/show'
    end

    get '/signup' do
        if !logged_in?
            erb :'/users/create_user'
        else
            redirect to '/reviews'
        end
    end

    post '/signup' do
        if params[:username] == "" || params[:password] == ""
            redirect to '/signup'
        else
            user = User.create(:username=>params[:username], :password=>params[:password])
            session[:user_id] = user.id
            redirect to '/login'
        end
    end

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect to '/reviews'
        end
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/reviews'
        else
            redirect to '/signup'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end


end