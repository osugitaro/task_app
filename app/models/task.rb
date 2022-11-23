class Task < ApplicationRecord
 validates :title, :start_date, :end_date, presence: true

 validate :cannot_day_past
 validate :later_than_end_date
 

 def cannot_day_past
  if start_date.present? && start_date.past?
    errors.add(:base, "開始日は今日よりも前の日付を選ぶことはできません。")
  elsif end_date.present? && end_date.past?
    errors.add(:base, "終了日は今日よりも前の日付を選ぶことはできません。")
  end
 end

 
 def later_than_end_date
  if start_date.present? && end_date.present?
   if start_date.after? end_date 
    errors.add(:base, "開始日は終了日よりも後の日付を選ぶことはできません。")
   end
  end
 end



 

end
