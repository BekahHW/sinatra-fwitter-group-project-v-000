require 'pry'
class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :'tweets/tweets'
    else
      redirect to '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'tweets/new'
    else
      redirect to '/login'
    end
  end

  post '/tweets' do
    if logged_in?
      if params[:content] == ""
        redirect "tweets/new"
      else
        @tweet = Tweet.create(content: params[:content])
        @tweet.user_id = current_user.id
        @tweet.save
        erb :'tweets/show'
      end
    else
      redirect "/login"
    end
  end

<<<<<<< HEAD
=======
  get "/tweets/:id" do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :'tweets/show'
    else
      redirect "/login"
    end
  end
>>>>>>> fd24fef4fdc8f2acbd409ad6968ed9ce29ce9388

  # post '/tweets/:id' do
  #   if logged_in? && current_user.include?(@tweet)
  #     @tweet = Tweet.find_by(id: params[:id])
  #     erb :'tweets/show'
  #   else
  #     erb :'users/login'
  #   end
  #
  # end

  get '/tweets/:id/edit' do
<<<<<<< HEAD

    @tweet = Tweet.find_by(id: params[:id])
    if logged_in? && @tweet.user_id == current_user.id
      #current_user.tweets.include?(Tweet.find_by(id: params[:id]))

      erb :'tweets/edit'
=======
    if logged_in? 
      # && current_user.tweets.include?(Tweet.find_by(id: params[:id]))
        @tweet = Tweet.find_by(id: params[:id])
        erb :'/tweets/edit'
>>>>>>> fd24fef4fdc8f2acbd409ad6968ed9ce29ce9388
    else
      redirect '/login'
    end
  end

<<<<<<< HEAD

  patch '/tweets/:id/edit' do
    @tweet = Tweet.find_by(id: params[:id])
    if logged_in? && @tweet.user_id == current_user.id
      if params[:tweet][:content].empty?
        redirect "/tweets/#{@tweet.id}/edit"
      else
        @tweet.update(content: params[:tweet][:content])
        redirect to "/tweets/#{@tweet.id}"
      end
=======
  patch '/tweets/:id/edit' do
    @tweet = Tweet.find_by(id: params[:id])
    if logged_in?
      @tweet.update(content: params[:content])
      redirect to "/tweets/#{@tweet.id}/edit"
>>>>>>> fd24fef4fdc8f2acbd409ad6968ed9ce29ce9388
    else
      erb :'users/login'
    end
  end


  get "/tweets/:id" do
    if logged_in?
      @tweet = Tweet.find_by(id: params[:id])
      erb :'tweets/show'
    else
      redirect "/login"
    end
  end

  delete '/tweets/:id/delete' do
    tweet = current_user.tweets.find_by(id: params[:id])
    if tweet && tweet.destroy
      redirect to '/tweets'
    else
      redirect to "/tweets/#{params[:id]}"

    end
  end

end
