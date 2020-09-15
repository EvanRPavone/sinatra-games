class ReviewsController < ApplicationController
    get '/reviews' do
        if logged_in?
            @user = current_user
            @reviews = Review.all
            erb :'/reviews/reviews'
        else
            redirect to '/login'
        end
    end

    get "/reviews/new" do
        if logged_in?
            @user = current_user
            erb :'/reviews/new'
        else
            redirect to '/login'
        end
    end

    post '/reviews' do
        @user = current_user
        if !params["content"].empty? || !params["game"].empty?
            @review = Review.create(:content => params["content"], :game => params["game"], user: @user)
            @review.user_id = @user.id
            @review.save
            redirect to "/reviews"
        else
            flash[:empty_review_error] = "Unable to create blank reviews."
            redirect to "/reviews/new"
        end
    end

    get '/reviews/:id' do
        if logged_in?
            @user = current_user
            @review = Review.find_by_id(params[:id])
            erb :'/reviews/show_review'
        else
            redirect to '/login'
        end
    end

    get '/reviews/:id/edit' do
        if !logged_in?
            redirect '/login'
        end

        @review = Review.find_by_id(params[:id])
        @user = current_user
        erb :'/reviews/edit'
    end

    get '/show_review' do
        @reviews = current_user.reviews
        erb :'/reviews/show_review'
    end

    patch '/reviews/:id' do
        @review = Review.find_by_id(params[:id])
        @user = current_user
        if !params["content"].empty? || !params["game"].empty?
            @review.content = params["content"]
            @review.game = params["game"]
            @review.save
            redirect "/reviews"
        else
            redirect "/reviews/#{@review[:id]}/edit"
        end
    end

    delete '/reviews/:id/delete' do
        if logged_in?
            @review = Review.find_by_id(params[:id])
            @user = current_user
            if @user.id == @review.user_id
                @review.delete
                redirect to '/reviews'
            end
        else
            redirect to '/login'
        end
    end
end