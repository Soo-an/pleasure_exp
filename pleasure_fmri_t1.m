function pleasure_fmri_t1(SID, SubjNum)

%% SETUP : Basic parameters

global theWindow W H window_ratio  %window property
global lb rb scale_W scale_H anchor_lms  %rating scale
global bgcolor white orange red  %color

basedir = pwd;
cd(basedir);
addpath(genpath(basedir));

%% SETUP : Save data according to subject information

savedir = fullfile(basedir, 'Data');

nowtime = clock;
SubjDate = sprintf('%.2d%.2d%.2d', nowtime(1), nowtime(2), nowtime(3));

data.subject = SID;
data.datafile = fullfile(savedir, [SubjDate, '_', SID, '_subj', sprintf('%.3d', SubjNum), ...
    '_t1', '.mat']);
data.version = 'Pleasure_v1_08-27-2018_Cocoanlab';
data.starttime = datestr(clock, 0);
data.starttime_getsecs = GetSecs;

% if the same file exists, break and retype subject info
if exist(data.datafile, 'file')
    fprintf('\n ** EXSITING FILE: %s %s **', data.subject, SubjDate);
    cont_or_not = input(['\nYou type the run number that is inconsistent with the data previously saved.', ...
        '\nWill you go on with your run number that typed just before?', ...
        '\n1: Yes, continue with typed run number.  ,   2: No, it`s a mistake. I`ll break.\n:  ']);
    if cont_or_not == 2
        error('Breaked.')
    elseif cont_or_not == 1
        save(data.datafile, 'data');
    end
else
    save(data.datafile, 'data');
end

%% SETUP : Create paradigm according to subject information

data.dat.type = 'T1';
data.dat.duration = 30;  % 15*60 (including disdaq)

%% SETUP : Screen

bgcolor = 50;
window_ratio = 3;

screens = Screen('Screens');
window_num = screens(1);
Screen('Preference', 'SkipSyncTests', 1);
screen_mode = 'testmode';
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
        window_rect = [0 0 400 300]; % in the test mode, use a little smaller screen
        fontsize = 10;
    case 'test'
        window_rect = [0 0 window_info.width window_info.height]/window_ratio;
        fontsize = 20;
    case 'testmode'
        window_rect = [0 0 1240 800];
        fontsize = 26;
end

% size
W = window_rect(3); % width
H = window_rect(4); % height

lb = W*(1/8); % rating scale left bounds 1/8
rb = W*(7/8); % rating scale right bounds 7/8

scale_W = W*0.1;
scale_H = H*0.1;

anchor_lms = [W/2-0.01*(W/2-lb) W/2-0.06*(W/2-lb) W/2-0.18*(W/2-lb) W/2-0.35*(W/2-lb) W/2-0.5*(W/2-lb);
    W/2+0.01*(W/2-lb) W/2+0.06*(W/2-lb) W/2+0.18*(W/2-lb) W/2+0.35*(W/2-lb) W/2+0.5*(W/2-lb)];
%W/2-lb = rb-W/2

% color
white = 255;
red = [158 1 66];
orange = [255 164 0];

% font
font = 'NanumBarunGothic';
Screen('Preference', 'TextEncodingLocale', 'ko_KR.UTF-8');

%% Start : Screen
sca
theWindow = Screen('OpenWindow', window_num, bgcolor, window_rect); % start the screen
%Screen('TextFont', theWindow, font);
Screen('TextSize', theWindow, fontsize);

Screen(theWindow, 'FillRect', bgcolor, window_rect); % Just getting information, and do not show the scale.
Screen('Flip', theWindow);
HideCursor;

%% Start

while true % Space
    msgtxt = '��� �� �����Կ��� ���۵� �����Դϴ�. �� ��Ÿ�� ȭ�� �߾��� + ǥ�ø� �����ϸ鼭 ����� ��ñ� �ٶ��ϴ�.\n�غ� �Ϸ�Ǹ� �����ڴ� �����̽��ٸ� �����ֽñ� �ٶ��ϴ�.';
    msgtxt = double(msgtxt);
    DrawFormattedText(theWindow, msgtxt, 'center', 'center', white, [], [], [], 2);
    Screen('Flip', theWindow);
    
    [~,~,keyCode] = KbCheck;
    if keyCode(KbName('space')) == 1
        break
    elseif keyCode(KbName('q')) == 1
        abort_experiment('manual');
        break
    end
end


while true % Ready, s
    DrawFormattedText(theWindow, double('�����ڰ� �غ�Ǿ�����, �̹�¡�� �����մϴ� (s).'), 'center', 'center', white, [], [], [], 2);
    Screen('Flip', theWindow);
    
    [~,~,keyCode] = KbCheck;
    if keyCode(KbName('s')) == 1
        break
    elseif keyCode(KbName('q')) == 1
        abort_experiment('manual');
        break
    end
end


% For disdaq ("�����մϴ١�") : 5 secs
data.dat.t1_starttime = GetSecs;
Screen(theWindow, 'FillRect', bgcolor, window_rect);
DrawFormattedText(theWindow, double('�����մϴ�...'), 'center', 'center', white, [], [], [], 1.2);
Screen('Flip', theWindow);
waitsec_fromstarttime(data.dat.t1_starttime, 5);

% For disdaq (blank & biopac) : 10 secs
Screen(theWindow,'FillRect',bgcolor, window_rect);
Screen('Flip', theWindow);
waitsec_fromstarttime(data.dat.t1_starttime, 15); % 5+10


% Fixation cross

t1_start_t = GetSecs;

while true
    DrawFormattedText(theWindow, double('+'), 'center', 'center', white, [], [], [], 2);
    Screen('Flip', theWindow);
    waitsec_fromstarttime(t1_start_t, 15) %duration
    
    [~,~,keyCode] = KbCheck;
    if keyCode(KbName('q')) == 1
        abort_experiment('manual');
        break
    end
    
end

data.dat.t1_endtime = GetSecs - data.dat.t1_starttime;

save(data.datafile, '-append', 'data')


ShowCursor;
sca;
Screen('CloseAll');

end