class PortfoliosController < ApplicationController
    before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
    layout 'portfolio'
    access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :edit, :sort]}, site_admin: :all

    def index
        @portfolio_items = Portfolio.by_position
    end

    def sort 
        params[:order].each do |key, value|
            Portfolio.find(value[:id]).update(position: value[:position])
        end
        render nothing: true

    end
    
    def angular
      @angular_portfolio_items = Portfolio.angular
    end
    

    def new
       @portfolio_item = Portfolio.new 
      
    end
    
    def create
        @portfolio_item = Portfolio.new(portfolios_params)
       
        if @portfolio_item.save
             redirect_to portfolios_path, notice: 'Portfolio was successfully created.'
        else
            render :new
        end
       
    end

    def edit
        @portfolio_item = Portfolio.find(params[:id])
    end

    def update
        @portfolio_item = Portfolio.find(params[:id])

      if  @portfolio_item.update(portfolios_params)
        redirect_to portfolios_path, notice: 'The record was successfully updated.' 
      else
       render :edit 
      end
    end
    def show

    end
    def destroy
        #perform the lookup
      
      #destroy/delete the record
      @portfolio_item.destroy
       
      #redirect
       redirect_to portfolios_url, notice: 'Record was successfully removed.' 
     
     
    end
    private
    
    def portfolios_params
        params.require(:portfolio).permit(:title,
                                         :subtitle, 
                                         :body,
                                         :main_image,
                                        :thumb_image,
                                        technologies_attributes: [:id, :name, :_destroy]
                                    )
    end
     def set_portfolio_item
        @portfolio_item = Portfolio.find(params[:id])

    end

end
