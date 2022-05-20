function TI = arduino_tclab(heater)

persistent icount a

if (isempty(icount))
    % include tclab.m for initialization
    tclab;
    icount = 0;
else
    % voltage read functions
    v1 = @() readVoltage(a, 'A0');
    v2 = @() readVoltage(a, 'A2');
    v3 = @() readVoltage(a, 'A1');
    v4 = @() readVoltage(a, 'A3');
    v5 = @() readVoltage(a, 'A4');
    
    % temperature calculations as a function of voltage for LM35
    TC35 = @(V) V*100.0;
    % temperature calculations as a function of voltage for TMP36
    TC = @(V) (V - 0.5)*100.0;          % Celsius
    TK = @(V) TC(V) + 273.15;           % Kelvin
    TF = @(V) TK(V) * 9.0/5.0 - 459.67; % Fahrenhiet
    
    % current calculations as a function of voltage for TMP36
    R = 2.3;                            % Resistor in the TCLAB (Ohms)
    ImA = @(V) (V/R)*1000.0;            % miliAmpers
    
    % temperature read functions for TMP36
    T1C = @() TC(v1());
    T2C = @() TC(v2());
    T3C = @() TC(v3());
    
    % temperature read functions for LM35
    T1C35 = @() TC35(v1());
    T2C35 = @() TC35(v2());
    T3C35 = @() TC35(v3());
    
    % current read functions 
    I1mA = @() ImA(v4());
    I2mA = @() ImA(v5());
    
    % LED function (0 <= level <= 1)
    led = @(level) writePWMDutyCycle(a,'D9',max(0,min(1,level)));  % ON
    
    % heater output (0 <= heater <= 100)
    % limit to 0-0.9 (0-100%)
    h1 = @(level) writePWMDutyCycle(a,'D3',max(0,min(100,level))*0.9/100);
    % limit to 0-0.5 (0-100%)
    h2 = @(level) writePWMDutyCycle(a,'D5',max(0,min(100,level))*0.5/100);
end

% increment counter
icount = icount + 1;

% read temperature and current
TC1 = T1C();
TC2 = T2C();
TC3 = T3C();
I1mA = I1mA();
I2mA = I2mA();
TC1_35 = T1C35();
TC2_35 = T2C35();
TC3_35 = T3C35();
TI = [TC1,TC2,TC3,I1mA,I2mA];

% write heater levels
h1(heater(1));
h2(heater(2));

% indicate high temperature with LED
if (TC1 || TC2) > 40
    led(1)
else
    led(0)    
end

end