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
        DrawFormattedText(theWindow, double('����'), lb-26, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����'), rb-26, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_glms'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('����'), lb-26, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����'), rb-26, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_int'  % one-directional
        start_center = false;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ��������\n      ����'), lb-130, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����� �� �ִ�\n   ���� ����'), rb-143, H*(1/2)+scale_H/1.2, white);

    case 'overall_boredness'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ������\n     ����'), lb-65, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� ���ܿ�'), rb-52, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_alertness'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('�ſ�\n ����'), lb-scale_H/1.8, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ�\n �Ƿ�'), rb-scale_H/1.8, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
 
    case 'overall_relaxed'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ������\n     ����'), lb-65, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� ����'), rb-52, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_attention'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ���ߵ���\n      ����'), lb-78, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� ����\n   �� ��'), rb-52, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_resting_positive'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n     �ʴ�'), lb-65, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb-52, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);

        
    case 'overall_resting_negative'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n     �ʴ�'), lb-65, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb-52, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_resting_myself'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n     �ʴ�'), lb-65, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb-52, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_resting_others'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n     �ʴ�'), lb-65, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb-52, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_resting_imagery'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n     �ʴ�'), lb-65, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb-52, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_resting_present'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n     �ʴ�'), lb-65, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb-52, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_resting_past'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n     �ʴ�'), lb-65, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb-52, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_resting_future'
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n     �ʴ�'), lb-65, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb-52, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_resting_bitter_int'  % one-directional
        start_center = false;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ��������\n      ����'), lb-78, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����� �� �ִ�\n   ���� ����'), rb-78, H*(1/2)+scale_H/1.2, white);
        
    case 'overall_resting_bitter_glms'
        lb = lb1;
        rb = rb1;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('����'), lb-26, H*(1/2)+scale_H, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����'), rb-26, H*(1/2)+scale_H, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_resting_capsai_int'  % one-directional
        start_center = false;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ��������\n      ����'), lb-78, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����� �� �ִ�\n   ���� ����'), rb-92, H*(1/2)+scale_H/1.2, white);
        
    case 'overall_resting_capsai_glms'
        lb = lb1;
        rb = rb1;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('����'), lb-26, H*(1/2)+scale_H, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����'), rb-26, H*(1/2)+scale_H, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_resting_sweet_int'  % one-directional
        start_center = false;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ��������\n      ����'), lb-78, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����� �� �ִ�\n   ���� ����'), rb-92, H*(1/2)+scale_H/1.2, white);
        
    case 'overall_resting_sweet_glms'
        lb = lb1;
        rb = rb1;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('����'), lb-26, H*(1/2)+scale_H, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����'), rb-26, H*(1/2)+scale_H, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        
    case 'overall_resting_touch_int'  % one-directional
        start_center = false;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/3, lb, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ��������\n      ����'), lb-78, H*(1/2)+scale_H/1.2, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����� �� �ִ�\n   ���� ����'), rb-92, H*(1/2)+scale_H/1.2, white);
        
    case 'overall_resting_touch_glms'
        lb = lb1;
        rb = rb1;
        Screen('DrawLine', theWindow, white, lb, H*(1/2), rb, H*(1/2), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(1/2)-scale_H/3, W/2, H*(1/2)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('����'), lb-26, H*(1/2)+scale_H, white);
        Screen('DrawLine', theWindow, white, lb, H*(1/2)-scale_H/2, lb, H*(1/2)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����'), rb-26, H*(1/2)+scale_H, white);
        Screen('DrawLine', theWindow, white, rb, H*(1/2)-scale_H/2, rb, H*(1/2)+scale_H/2, 6);       
           
end

end


