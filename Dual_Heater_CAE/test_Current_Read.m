close all; clear all; clc

% include tclab.m for initialization
tclab;

% Test device
disp(['Current 1: ' num2str(I1mA()) ' mA'])
disp(['Current 2: ' num2str(I2mA()) ' mA'])


disp('Turn on LED for 30 seconds')
led(1);   % ON
disp('Turn on Heater 1 from 0% to 60%, Heater 2 from 0% to 90%')
for i=0:30
    h1(i*2);  h2(i*3);
    disp(['Heater 1: ' num2str(i*2) ', Heater 2: ' num2str(i*3)])
    disp(['Current 1: ' num2str(I1mA()) ' mA'])
    disp(['Current 2: ' num2str(I2mA()) ' mA'])
    disp('_____________________________________')
    pause(1.0);
end
led(0); % OFF

disp('Turn off Heaters')
h1(0);  h2(0);


disp('Current Test Complete')
