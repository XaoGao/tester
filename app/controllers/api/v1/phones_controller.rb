class Api::V1::PhonesController < Api::ApiController
  def index
    phones = Phone.all
    render_ok({ phones: PhoneSerializer.new(phones) })
  end

  def create
    phone = Phone.new phone_params
    if phone.save
      render_no_content
    else
      render_bad_request 'Ошибка при добавлении номера'
    end
  end

  def update
    phone = Phone.find_by(id: params[:id])
    if phone.blank?
      render_bad_request "Нет телефона с id #{params[:id]}"
      return
    end

    if phone.update phone_params
      render_ok({ phone: PhoneSerializer.new(phone) })
    else
      render_bad_request 'Ошибка при обновлении номера'
    end
  end

  private

  def phone_params
    params.require(:phone).permit(:number)
  end
end
