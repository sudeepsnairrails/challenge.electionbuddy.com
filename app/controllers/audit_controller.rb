class AuditController < ApplicationController
    def show
       @audit_list = Election.find(params[:id]).audits
    end
end
