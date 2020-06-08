class Api::V1::WalletsController < Api::V1::ApiController

    before_action :set_wallet, only: [:show, :update, :destroy]

    before_action :require_authorization!, only: [:show, :update, :destroy]

    skip_before_action :verify_authenticity_token, only: [:create, :destroy]

    # GET /api/v1/wallets

    def index
 
        @wallet = current_user.wallet
      
        render json: @wallet
      
    end

    # GET /api/v1/wallets/1
 
    def show
    
        render json: @wallet
    
    end

    # POST /api/v1/wallets
 
    def create

    
        @wallet = Wallet.new(wallet_params.merge(user: current_user))
    
        if @wallet.save
          render json: @wallet, status: :created
    
        else
          render json: @wallet.errors, status: :unprocessable_entity
    
        end
    
    end

    # PATCH/PUT /api/v1/wallets/1
 
    def update
    
        if @wallet.update(wallet_params)
          render json: @wallet
    
        else
          render json: @wallet.errors, status: :unprocessable_entity
    
        end
    
    end

    # DELETE /api/v1/wallet/1
 
    def destroy
    
        @wallet.destroy
    
    end


    private
 
    # Use callbacks to share common setup or constraints between actions.
  
    def set_wallet
  
      @wallet = Wallet.find(params[:id])
  
    end
  
    # Only allow a trusted parameter "white list" through.
  
    def wallet_params
  
      params.require(:wallet).permit(:active, :total_active, :active_price, :total)
  
    end
  
    def require_authorization!
  
      unless current_user == @wallet.user
  
        render json: {}, status: :forbidden
  
      end
  
    end

end
