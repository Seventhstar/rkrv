class AddConferenceRecordTypeToConferenceRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :conference_records, :conference_record_type, foreign_key: true
  end
end
