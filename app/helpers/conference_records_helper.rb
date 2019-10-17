module ConferenceRecordsHelper

  def link_to_last_file(cr)
    l = ""
    if cr.attachments.count > 0
      file = cr.attachments.last
      a = link_to '', file.download_path, class: "icon icon_download", target: '_blank'
      l = file_default_action(file, nil, true, true) + a
    end
    l
  end

end
