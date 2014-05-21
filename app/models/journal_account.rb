class JournalAccount < ActiveRecord::Base
  include Journalist::JournalAccountModel

  def toggle_enable
    if enable
      update(enable: false)
    else
      update(enable: true)
    end
  end
end
