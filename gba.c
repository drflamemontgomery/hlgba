#define HL_NAME(n) gba_##n

#include <hl.h>
#include <locale.h>

unsigned short *Screen = (void*)0x6000000;
static volatile unsigned short * const reg_disp_ctl = (void*)0x4000000;
int* KEYS = (int*)0x04000130;

typedef struct {
  hl_type *t;
  int button;
} event_data;

HL_PRIM bool HL_NAME(init_once)() {

  *(unsigned long *)reg_ctl = 0x403;
  *(unsigned short *)reg_ctl &= ~0x10;
  
  return true;
}

HL_PRIM bool HL_NAME(event_loop)( event_data *event ) {
  while (true) {
    for(int i = 0; i < 10; i++) {
      if(!((*KEYS) & (1<<i))) {
	event->button = i+1;
      }
    }
    return true;
  }
  return false;
}

HL_PRIM void HL_NAME(delay)( int time ) {
  hl_blocking(true);
  __asm__("ld a,-1");
  hl_blocking(false);
}

HL_PRIM int HL_NAME(get_screen_width)() {
	return 240;
}

HL_PRIM int HL_NAME(get_screen_height)() {
	return 160;
}


DEFINE_PRIM(_BOOL, init_once, _NO_ARG);
DEFINE_PRIM(_BOOL, event_loop, _DYN );
DEFINE_PRIM(_VOID, delay, _I32);
DEFINE_PRIM(_I32, get_screen_width, _NO_ARG);
DEFINE_PRIM(_I32, get_screen_height, _NO_ARG);
