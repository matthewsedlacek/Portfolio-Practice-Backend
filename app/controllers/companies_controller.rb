class CompaniesController < ApplicationController
    def index
        companies = Company.all
        render json: CompanySerializer.new(companies)
    end
    
    def show
        company = Company.find_by(id: params[:id])
        render json: CompanySerializer.new(company)
    end

    def create
        company = Company.create(company_params)
        render json: CompanySerializer.new(company)
    end

    def edit
        company = Company.update(company_params)
        render json: CompanySerializer.new(company)
    end

    def destroy
        company = Company.find(params[:id])
        company.destroy
        render json: {info: "Deleted"}
    end

    private
    def company_params
        params.require(:company).permit(:ticker, :name, :logo, :sector)
    end
end
