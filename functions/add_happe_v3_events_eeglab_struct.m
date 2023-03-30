function [EEGraw] = add_happe_v3_events_eeglab_struct(file_proc_info,EEGraw,curr_rec_period)
%need to figure out which applies to all data types and which are specific
if file_proc_info.src_format_typ == 2
    for event = 1:length(file_proc_info.evt_info{1,curr_rec_period})
    EEGraw.event(event).description = file_proc_info.evt_info{1,curr_rec_period}(event).description;
    EEGraw.event(event).begintime = file_proc_info.evt_info{1,curr_rec_period}(event).evt_times;
    EEGraw.event(event).classid = file_proc_info.evt_info{1,curr_rec_period}(event).classid;
    EEGraw.event(event).code = file_proc_info.evt_info{1,curr_rec_period}(event).evt_codes;
    EEGraw.event(event).duration = file_proc_info.evt_info{1,curr_rec_period}(event).duration_time;
    EEGraw.event(event).label = file_proc_info.evt_info{1,curr_rec_period}(event).label;
  %  EEGraw.event.relativebegintime = file_proc_info.evt_info{1,curr_rec_period}.relativebegintime;
    EEGraw.event(event).sourcedevice = file_proc_info.evt_info{1,curr_rec_period}(event).sourcedevice;
    EEGraw.event(event).name = file_proc_info.evt_info{1,curr_rec_period}(event).name;
    EEGraw.event(event).tracktype	= file_proc_info.evt_info{1,curr_rec_period}(event).tracktype;
    EEGraw.event(event).latency_1 = file_proc_info.evt_info{1,curr_rec_period}(event).evt_times_micros_rel/1000;
    EEGraw.event(event).type	= file_proc_info.evt_info{1,curr_rec_period}(event).evt_codes;
    
    %% check for extra mff keys
    field_names = fieldnames(file_proc_info.evt_info{1,curr_rec_period});
    mff_field_idx = find(contains(fieldnames(file_proc_info.evt_info{1,curr_rec_period}),'mff'));
    mff_field_names = field_names(mff_field_idx);
    for keys = 1:length(mff_field_names)
        EEGraw.event(event).(mff_field_names{1,1}) = file_proc_info.evt_info{1,curr_rec_period}(event).(mff_field_names{1,1});
    end
    end
end
end
