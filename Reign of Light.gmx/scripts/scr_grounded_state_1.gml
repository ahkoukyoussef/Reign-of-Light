///scr_grounded_state()

image_index=0;

if(ult.alarm[0]<=0){
state=scr_move_state_1;

with(ult){
    instance_destroy();
}

}