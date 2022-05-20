%Single Test employing LM35 instead of TMP36
close all; clear all; clc

% include tclab.m for initialization
tclab;

% Test device
disp(['Temperature 1: ' num2str(T1C35()) ' degC'])

disp('Turn on Heater 1 to 30%')
h1(60); 

disp('Turn on LED for 30 seconds')
led(1);   % ON
disp('Wait......')
pause(30.0);
led(0); % OFF

disp('Turn off Heaters')
h1(0); 

disp(['Temperature 1: ' num2str(T1C35()) ' degC'])

disp('Temperature Test Complete')
