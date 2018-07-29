function practice_glms
 
global theWindow W H window_ratio  %window property
global lb rb scale_W scale_H anchor_lms  %rating scale
global bgcolor white orange red  %color
 
% Practice gLMS with visualization
 
x = W/2; %center
y = H*(3/4); %center*(3/2)
 
SetMouse(x,y)
 
while true
    
    DrawFormattedText(theWindow, double('�� ���� : �����ڴ� ����� �� ����� ������ ��, ������ ������ ��ư�� �����ֽñ� �ٶ��ϴ�.'), 'center', H*(1/4), white, [], [], [], 2);
    [x,~,button] = GetMouse(theWindow); 
    
    if x < lb
        x = lb;
    elseif x > rb
        x = rb;
    end
    
    if button(1)
        while button(1)
            [x,~,button] = GetMouse(theWindow);
        end
        break
    end
    Screen('DrawLine', theWindow, white, lb, H*(3/4), rb, H*(3/4), 4); %rating scale
    % penWidth: 0.125~7.000
    Screen('DrawLine', theWindow, white, W/2, H*(3/4)-scale_H/3, W/2, H*(3/4)+scale_H/3, 6);
    Screen('DrawLine', theWindow, white, lb, H*(3/4)-scale_H/2, lb, H*(3/4)+scale_H/2, 6);
    Screen('DrawLine', theWindow, white, rb, H*(3/4)-scale_H/2, rb, H*(3/4)+scale_H/2, 6);
    Screen('DrawLine', theWindow, orange, x, H*(3/4)-scale_H/1.5, x, H*(3/4)+scale_H/1.5, 6); %rating bar
    Screen('Flip', theWindow);
    
end
end

