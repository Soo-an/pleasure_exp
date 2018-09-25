function [lb, rb, start_center] = draw_scale_pls(scale)

global theWindow W H window_ratio  %window property
global lb1 rb1 lb2 rb2 scale_W scale_H anchor_lms  %rating scale
global bgcolor white orange red  %color

%% Basic Settings
start_center = true;
lb = lb2;
rb = rb2;

%% Drawing scale
switch scale
    case 'cont_glms'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-scale_H/2.8, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb-scale_H/2.8, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_glms'
        lb = lb1; % rating scale left bounds 1/6
        rb = rb1; % rating scale right bounds 5/6
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('불쾌'), lb-scale_H/2.8, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('유쾌'), rb-scale_H/2.8, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_int'  % one-directional
        start_center = false;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n      않음'), lb-scale_H/0.8, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n   가장 심한'), rb-scale_H/0.7, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        
    case 'general_sensitivity'  % one-directional
        start_center = false;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('느낄 수\n  없음'), lb-scale_H/2, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('      상상할 수 있는\n가장 강한 정도의 자극'), rb-scale_H/0.7, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        
    case 'overall_boredness'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 지겹지\n     않음'), lb-scale_H/1.3, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 지겨움'), rb-scale_H/1.5  , H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_alertness'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 졸림'), lb-scale_H/1.4, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 또렷'), rb-scale_H/1.4, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_relaxed'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 편하지\n     않음'), lb-scale_H/1.3, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 편함'), rb-scale_H/1.4, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_attention'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 집중되지\n      않음'), lb-scale_H/0.9, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 집중\n   잘 됨'), rb-scale_H/1.4, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_resting_positive'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n     않다'), lb-scale_H/1.3, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb-scale_H/1.5, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
        
    case 'overall_resting_negative'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n     않다'), lb-scale_H/1.3, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb-scale_H/1.5, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_resting_myself'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n     않다'), lb-scale_H/1.3, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb-scale_H/1.5, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_resting_others'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n     않다'), lb-scale_H/1.3, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb-scale_H/1.5, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_resting_imagery'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n     않다'), lb-scale_H/1.3, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb-scale_H/1.5, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_resting_present'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n     않다'), lb-scale_H/1.3, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb-scale_H/1.5, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_resting_past'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n     않다'), lb-scale_H/1.3, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb-scale_H/1.5, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_resting_future'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 그렇지\n     않다'), lb-scale_H/1.3, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('매우 그렇다'), rb-scale_H/1.5, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_resting_bitter_int'  % one-directional
        start_center = false;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n      않음'), lb-scale_H/1.1, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n   가장 강한'), rb-scale_H/0.9, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        
    case 'overall_resting_bitter_glms'
        lb = lb1;
        rb = rb1;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n가장 강한 불쾌'), lb-scale_H, H*(1/2)+scale_H, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n가장 강한 유쾌'), rb-scale_H, H*(1/2)+scale_H, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_resting_capsai_int'  % one-directional
        start_center = false;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n      않음'), lb-scale_H/1.1, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n   가장 강한'), rb-scale_H/0.9, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        
    case 'overall_resting_capsai_glms'
        lb = lb1;
        rb = rb1;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n가장 강한 불쾌'), lb-scale_H, H*(1/2)+scale_H, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n가장 강한 유쾌'), rb-scale_H, H*(1/2)+scale_H, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_resting_sweet_int'  % one-directional
        start_center = false;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n      않음'), lb-scale_H/1.1, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n   가장 강한'), rb-scale_H/0.9, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        
    case 'overall_resting_sweet_glms'
        lb = lb1;
        rb = rb1;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n가장 강한 불쾌'), lb-scale_H, H*(1/2)+scale_H, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n가장 강한 유쾌'), rb-scale_H, H*(1/2)+scale_H, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
    case 'overall_resting_touch_int'  % one-directional
        start_center = false;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('전혀 느껴지지\n      않음'), lb-scale_H/1.1, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n   가장 강한'), rb-scale_H/0.9, H*(1/2)+scale_H/1.2, white,[],[],[],1.5);
        
    case 'overall_resting_touch_glms'
        lb = lb1;
        rb = rb1;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n가장 강한 불쾌'), lb-scale_H, H*(1/2)+scale_H, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('상상할 수 있는\n가장 강한 유쾌'), rb-scale_H, H*(1/2)+scale_H, white,[],[],[],1.5);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/3, rb, H*(1/2)+scale_H/3, 6);
        
end

end