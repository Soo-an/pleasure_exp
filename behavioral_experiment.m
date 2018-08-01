clc;
clear;
close all;

%% Subject info & add directory
 
sid = input('\nSubject ID? : ', 's');
sid = strtrim(sid);
subjnum = input('\nSubject number? : ');
stimtype = input('\nStimulus type? : ', 's');
 
basedir = pwd;
cd(basedir); addpath(genpath(basedir));
 
%% Basic settings, Explain & Practice
 
global theWindow W H window_ratio  %window property
global lb rb scale_W scale_H anchor_lms  %rating scale
global bgcolor white orange red  %color 


screens = Screen('Screens');  
window_num = screens(end); 
Screen('Preference', 'SkipSyncTests', 0);
screen_mode = 'testmode'; 
window_ratio = 1.11  ; 
window_info = Screen('Resolution', window_num);
switch screen_mode
    case 'full'
        window_rect = [0 0 window_info.width window_info.height]; % full screen
        fontsize = 32;
    case 'semifull'   
        window_rect = [0 0 window_info.width-100 window_info.height-100]; % a little bit distance
    case 'middle'
        window_rect = [0 0 window_info.width/2 window_info.height/2];
    case 'small'
        window_rect = [0 0 1200 720]; % in the test mode, use a little smaller screen
        fontsize = 10;
    case 'test'
        window_rect = [0 0 window_info.width window_info.height]/window_ratio;
        fontsize = 20;
    case 'testmode'
        window_rect = [0 0 1800 960];
        fontsize = 30;
end
 
% color
bgcolor = 50;   
white = 255;
red = [158 1 66];
orange = [255 164 0];

% size
W = window_rect(3); % width
H = window_rect(4); % height
 
lb = W*(1/6); % rating scale left bounds 1/4
rb = W*(5/6); % rating scale right bounds 3/4
 
scale_W = (rb-lb)*0.1;
scale_H = H*0.1;

anchor_lms = [W/2-0.01*(W/2-lb) W/2-0.06*(W/2-lb) W/2-0.18*(W/2-lb) W/2-0.35*(W/2-lb) W/2-0.5*(W/2-lb);
    W/2+0.01*(W/2-lb) W/2+0.06*(W/2-lb) W/2+0.18*(W/2-lb) W/2+0.35*(W/2-lb) W/2+0.5*(W/2-lb)];
%W/2-lb = rb-W/2
 
% start the screen
theWindow = Screen('OpenWindow', window_num, bgcolor, window_rect);
 
% font
%font = 'Helvetica';
font = 'NanumBarunGothic';
Screen('Preference', 'TextEncodingLocale', 'ko_KR.UTF-8');
  
%Screen('TextFont', theWindow, font);
Screen('TextSize', theWindow, fontsize); 
 
 
%  Start
rec_i = 0;
x = W/2; %center 
y = H*(5/8); %center*(3/2)
 
 
HideCursor;
 
 
% Explain
explain_glms
 
  
% Practice 
practice_glms 
    
sca;
Screen('CloseAll'); 
 
%% Start behavioral experiment
 
% start the screen
theWindow = Screen('OpenWindow', window_num, bgcolor, window_rect);
HideCursor;

% Continuous rating 
while true
    DrawFormattedText(theWindow, double('���ݺ��� ������ �����մϴ�. �����Ϸ��� �����̽��ٸ� �����ּ���.'), 'center', 'center', white);
    Screen('Flip', theWindow);
    [~,~,keyCode] = KbCheck;
        if keyCode(KbName('space')) == 1
            break  
        end
end 
   
rec_i = 0;
start_t = GetSecs;
x = W/2; y = H*(5/8);
SetMouse(x,y)
 
while true
    rec_i = rec_i + 1;
    [x,~,button] = GetMouse(theWindow); %record only x value
     
    if x < lb
        x = lb;
    elseif x > rb
        x = rb;
    end
    
    msgtxt = '�ش� �ڱ��� �󸶳� ����/���������� ���� �����ּ���.\n ������ �������� ��ư�� �����ּ���.';
    DrawFormattedText(theWindow, double(msgtxt), 'center', H*(1/4), white, [], [], [], 2 );
    Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); %rating scale
    % penWidth: 0.125~7.000
    Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
    DrawFormattedText(theWindow, double('����'), lb-60, H*(5/8)+10, white);
    Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
    DrawFormattedText(theWindow, double('����'), rb+20, H*(5/8)+10, white);
    Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
    Screen('DrawLine', theWindow, orange, x, H*(5/8)-scale_H/2, x, H*(5/8)+scale_H/2, 6); %rating bar
    Screen('Flip', theWindow);
    
    if button(1) == 1 
        break  %click to stop 
    end
    
    cur_t = GetSecs;
    data.dat.time_fromstart(rec_i,1) = cur_t-start_t;
    data.dat.cont_rating(rec_i,1) = (x-W/2)/(rb-lb).*2;
    
end

 
ShowCursor;
Screen('Clear');
Screen('CloseAll');

 
%% show the graph
plot(data.dat.time_fromstart, data.dat.cont_rating)
ylim([-1 1])
 
%% Save the behavioral data
 
savedir = fullfile(basedir, 'Behav_Data');
nowtime = clock;
subjtime = sprintf('%.2d%.2d%.2d', nowtime(1), nowtime(2), nowtime(3));

data.subject = sid;
data.datafile = fullfile(savedir, [subjtime, '_', sid, '_subj', sprintf('%.3d', subjnum), '_behav_dat_', stimtype, '.mat']);  
data.version = 'Pleasure_v1_08-01-2018_Cocoanlab';
data.dat.time_fromstart(rec_i,1) = cur_t-start_t;
data.dat.cont_rating(rec_i,1) = (x-W/2)/(rb-lb).*2;
data.dat.stimtype = stimtype;
 
save(data.datafile, 'data');
