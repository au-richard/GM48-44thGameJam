/// @description Move To Next Room

with (oPlayer) {
	if (hascontrol) {
		hascontrol = false;
		SlideTransition(TRANS_MODE.GOTO, other.target);
		mode = TRANS_MODE.INTRO;		
	}
}


//SlideTransition(TRANS_MODE.NEXT);
//mode = TRANS_MODE.INTRO;	

//SlideTransition(room_goto(other.target));
//mode = TRANS_MODE.INTRO;	