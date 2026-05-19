class CompaniesController < ApplicationController
  def index
    companies = Company.all
    render json: companies
  end

  def show
    company = Company.find_by(id: params[:id])
    render json: CompanySerializer.new(company)
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: CompanySerializer.new(company), status: :created
    else
      render json: { errors: company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    company = Company.find_by(id: params[:id])
    unless company
      render json: { error: 'Not found' }, status: :not_found
      return
    end
    if company.update(company_params)
      render json: CompanySerializer.new(company)
    else
      render json: { errors: company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    company = Company.find_by(id: params[:id])
    unless company
      render json: { error: 'Not found' }, status: :not_found
      return
    end
    company.destroy
    render json: { info: 'Deleted' }
  end

  private

  def company_params
    params.require(:company).permit(:ticker, :name, :logo, :sector)
  end
end
