class UserNotifierMailer < ApplicationMailer
  def signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Bienvenido a nuestra pagina!' )
  end

  def campaign_edit(user, campaign)
    @user = user
    @campaign = campaign
    mail( :to => @user.email,
    :subject => 'Ha edito una campana' )
  end

  def campaign_create(user, campaign)
    @user = user
    @campaign = campaign
    mail( :to => @user.email,
    :subject => 'Ha creado una campana' )
  end

  def new_donation(user, donation, campaign)
    @user = user
    @donation = donation
    @campaign = campaign
    mail( :to => @user.email,
    :subject => 'Ha recibido una donacion!')
  end

  def new_comment(user, comment, campaign)
    @user = user
    @comment = comment
    @campaign = campaign
    mail( :to => @user.email,
    :subject => 'Ha recibido un comentario!')
  end

  def password_edit(user)
    @user = user
    mail( :to => @user.email,
    :subject => "Ha cambiado su contrasena")
  end
end
