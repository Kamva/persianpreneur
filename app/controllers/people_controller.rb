class PeopleController < ApplicationController

	before_filter :require_login, except: [:new, :create, :index]

	include PeopleHelper

	def index
		@people = Person.all.where(published: true)
	end

	def show
		@person = Person.find(params[:id])
	end

	def new
		@person = Person.new
		@person.published = false
	end

	def create
		@person = Person.new(person_params)
		if @person.save
			redirect_to root_path
			flash.notice = "Person '#{@person.full_name}' was successfully created."
		else
			render('new')
		end
	end

	def edit
		@person = Person.find(params[:id])
	end

	def update
		@person = Person.find(params[:id])
		if @person.update(person_params)
			redirect_to admin_manage_people_path
			flash.notice = "Person '#{@person.full_name}' was successfully updated."
		else
			render 'edit'
		end
	end

	def destroy
		@person = Person.find(params[:id]).destroy
		flash.notice = "Person '#{@person.full_name}' was successfully destroyed."
		redirect_to admin_manage_people_path
	end

end