///scr_get_input()
up_key = keyboard_check(ctrl_up);
right_key = keyboard_check(ctrl_right);
down_key = keyboard_check(ctrl_down);
left_key = keyboard_check(ctrl_left);
enter_key = keyboard_check_pressed(ctrl_enter);
dash_key = keyboard_check_pressed(ctrl_dash);
attack_key = keyboard_check_pressed(ctrl_attack);
special1_key_p = keyboard_check_pressed(ctrl_special1);
special1_key_r = keyboard_check_released(ctrl_special1);
special2_key = keyboard_check_released(ctrl_special2);
pause_key = keyboard_check_pressed(ctrl_pause);
ctrl_key_p = keyboard_check(ctrl_ctrl);
ctrl_key_r = keyboard_check_released(ctrl_ctrl);



//check for gamepad input
if (gamepad_is_connected(0)){   

up_key = gamepad_axis_value(0,gp_axislv) <= -0.5;
right_key = gamepad_axis_value(0,gp_axislh) >= 0.5;
down_key = gamepad_axis_value(0,gp_axislv)  >= 0.5;
left_key = gamepad_axis_value(0,gp_axislh) <= -0.5;
dash_key = gamepad_button_check_pressed(0,gp_face1);
attack_key = gamepad_button_check_pressed(0,gp_face3);
pause_key = gamepad_button_check_pressed(0,gp_start);
}