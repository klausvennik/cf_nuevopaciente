class StudentContactController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid

  def index
    student_id = params[:id].to_i
    @student = Student.find(student_id)
  end

  def success
    name = params[:name]
    lastname = params[:lastname]
    phone = params[:phone]
    email = params[:email]
    message = params[:message]
    email_student = params[:email_student]

    if !name.nil?
      detail = "Un nuevo paciente te ha escrito. Estos son sus datos de contacto:\n\n"
      footer = "\n\nRecuerda escribirle a tu nuevo paciente directamente a su correo o contáctalo por teléfono."
      info = detail + name + " " + lastname + "\n" + phone + "\n" + email
      contentmail = info + "\n\n" + message + footer
      from = Email.new(email: 'contacto@nuevopaciente.cl')
      to = Email.new(email: email_student)
      subject = 'Nuevo mensaje desde Nuevo Paciente'
      content = Content.new(type: 'text/plain', value: contentmail)
      mail = Mail.new(from, subject, to, content)

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers
      respond_to do |format|
        format.html { redirect_to root_path, notice: t(:message_success) }
        format.json { head :no_content }
      end  
    end 
  end
end
