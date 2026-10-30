class SubscriptionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_subscription, only: %i[show edit update destroy]

    def index
       @subscriptions = current_user.subscriptions
       @total_price = @subscriptions.sum(:price)
    end

    def show  
    end

    def new
        @subscription = Subscription.new
    end

    def create
        @subscription = current_user.subscriptions.build(subscription_params)

        if @subscription.save
            redirect_to subscriptions_path, notice: 'Assinatura cadastrada com sucesso!'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit   
    end

    def update 
        if @subscription.update(subscription_params)
            redirect_to @subscription, notice: 'Assinatura atualizada com sucesso!'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
         @subscription.destroy
         redirect_to subscriptions_path, notice: 'Assinatura apagada com sucesso!'
    end

private

    def subscription_params
        params.require(:subscription).permit(:name, :due_date, :category, :price)
    end

    def set_subscription
         @subscription = current_user.subscriptions.find(params[:id])
    end
end