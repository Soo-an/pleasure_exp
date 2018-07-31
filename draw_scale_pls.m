function [lb, rb, one_directional] = draw_scale_pls(scale)

global theWindow W H window_ratio  %window property
global lb rb scale_W scale_H anchor_lms  %rating scale
global bgcolor white orange red  %color

%% Basic Settings
one_directional = false;


%% Drawing scale
switch scale
    case 'cont_glms'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('����'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_glms'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('����'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_int'  % one-directional
        one_directional = true;
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/3, lb, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ��������\n ����'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����� �� �ִ�\n ���� ����'), rb+20, H*(5/8)+10, white);

    case 'overall_boredness'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ������\n ����'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� ���ܿ�'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_alertness'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('�ſ� ����'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �Ƿ�'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
 
    case 'overall_relaxed'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('�ſ� ������'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� ����'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_attention'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ���ߵ���\n ����'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� ����\n �� ��'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_positive'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n �ʴ�'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);

        
    case 'overall_resting_negative'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n �ʴ�'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_myself'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n �ʴ�'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_others'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n �ʴ�'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_imagery'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n �ʴ�'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_present'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n �ʴ�'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_past'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n �ʴ�'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_future'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� �׷���\n �ʴ�'), lb-90, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('�ſ� �׷���'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_bitter_int'
        one_directional = true;
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/3, lb, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ��������\n ����'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����� �� �ִ�\n ���� ����'), rb+20, H*(5/8)+10, white);
        
    case 'overall_resting_bitter_glms'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('����'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_capsai_int'
        one_directional = true;
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/3, lb, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ��������\n ����'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����� �� �ִ�\n ���� ����'), rb+20, H*(5/8)+10, white);
        
    case 'overall_resting_capsai_glms'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('����'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_sweet_int'
        one_directional = true;
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/3, lb, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ��������\n ����'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����� �� �ִ�\n ���� ����'), rb+20, H*(5/8)+10, white);
        
    case 'overall_resting_sweet_glms'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('����'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        
    case 'overall_resting_touch_int'
        one_directional = true;
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/3, lb, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('���� ��������\n ����'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����� �� �ִ�\n ���� ����'), rb+20, H*(5/8)+10, white);
        
    case 'overall_resting_touch_glms'
        Screen('DrawLine', theWindow, white, lb, H*(5/8), rb, H*(5/8), 4); % penWidth: 0.125~7.000
        Screen('DrawLine', theWindow, white, W/2, H*(5/8)-scale_H/3, W/2, H*(5/8)+scale_H/3, 6);
        DrawFormattedText(theWindow, double('����'), lb-50, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, lb, H*(5/8)-scale_H/2, lb, H*(5/8)+scale_H/2, 6);
        DrawFormattedText(theWindow, double('����'), rb+20, H*(5/8)+10, white);
        Screen('DrawLine', theWindow, white, rb, H*(5/8)-scale_H/2, rb, H*(5/8)+scale_H/2, 6);       
           
end

end


