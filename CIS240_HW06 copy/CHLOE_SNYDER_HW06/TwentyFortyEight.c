/*
 * TwentyFortyEight.c : Camillo J. Taylor - Sept. 23, 2014
 */

#include "lc4libc.h"


/*
 * #############  DATA STRUCTURES THAT STORE THE GAME STATE ######################
 */

// The game state is encoded in this 4x4 array where tile[0][0] corresponds to the upper left tile, tile[0][1] is the tile
// immediately to its right and tile[1][0] is the tile immediately below etc. etc. The legal entries are 0, 2, 4, 8, 16 etc
// where 0 corresponds to an empty spot.

int tile[4][4];

int score;

/*
 * #############  HELPER FUNCTIONS ######################
 */


//
// routine for printing out 2C 16 bit numbers in LC4
//
void printnum (int n) {
  int abs_n;
  char str[10], *ptr;

  // Corner case (n == 0)
  if (n == 0) {
    lc4_puts ((lc4uint*)"0");
    return;
  }
 
  abs_n = (n < 0) ? -n : n;

  // Corner case (n == -32768) no corresponding +ve value
  if (abs_n < 0) {
    lc4_puts ((lc4uint*)"-32768");
    return;
  }

  ptr = str + 10; // beyond last character in string

  *(--ptr) = 0; // null termination

  while (abs_n) {
    *(--ptr) = (abs_n % 10) + 48; // generate ascii code for digit
    abs_n /= 10;
  }

  // Handle -ve numbers by adding - sign
  if (n < 0) *(--ptr) = '-';

  lc4_puts((lc4uint*)ptr);
}

void endl () {
  lc4_puts((lc4uint*)"\n");
}

// rand16 returns a pseudo-random number between 0 and 15 by simulating the action of a 16 bit Linear Feedback Shift Register.
int rand16 ()
{
  int lfsr;

  // Advance the lfsr four times
  lfsr = lc4_lfsr();
  lfsr = lc4_lfsr();
  lfsr = lc4_lfsr();
  lfsr = lc4_lfsr();

  // return the last 4 bits
  return (lfsr & 0xF);
}

/*
 * #############  CODE THAT DRAWS THE SCENE ######################
 */

// COLOR_2 : BLUE - 0 00000 00000 11111
#define COLOR_2       0x001FU

// COLOR_2 : GREEN - 0 000001 1 111 0 0000
#define COLOR_4       0x03E0U

// COLOR_8 :      - 0 00000 11 111 1 1111
#define COLOR_8       0x03FFU

// COLOR_16 :      - 0 111 11 11 111 0 0000 
#define COLOR_16      0x7FE0U

// COLOR_32 :      - 0 111 11 00 000 1 1111
#define COLOR_32      0x3C1FU

// COLOR_64 :      - 0 111 11 00 000 1 0000
#define COLOR_64      0x07C10U

// COLOR_128 :      - 0 100 00 00 000 1 1111
#define COLOR_128     0x401FU

// COLOR_256 :      - 0 111 11 10 000 1 1111
#define COLOR_256     0x7E1FU

// COLOR_512 :      - 0 100 00 00 000 1 1111
#define COLOR_512     0x401FU

// COLOR_1024 :    - 0 111 11 10 000 0 0000
#define COLOR_1024    0x7E00U

// COLOR_2048 : RED - 0 11111 00000 00000
#define COLOR_2048    0x7C00U

// WHITE
#define WHITE   0xFFFFU

int log(int x) {
  int result = 0;
  while ((x / 2) != 0) {
    x = x / 2;
    result++; 
  }
  return result;
}

void drawTiles () {
  unsigned int color[11] = { COLOR_2, COLOR_4, COLOR_8, COLOR_16, COLOR_32, COLOR_64, 
                                COLOR_128, COLOR_256, COLOR_512, COLOR_1024, COLOR_2048 };
  int codes[11][4] = { {93}, {46}, {127}, {36, 123}, {109, 93}, {123, 46}, {36,93,127}, 
                              {93,107,123}, {107,36,93}, {36,119,93,46}, {93,119,46,127} };
  int offset[4][4] = { {12}, {9,16}, {6,13,19}, {3,10,16,22} };                      
  int r;
  int c;
  int x;
  for (r = 0; r < 4; r++) {
    for (c = 0; c < 4; c++) {
      if (tile[r][c] == 0) {}
      else {
        int x1 = c * 31;
        int y1 = r * 31;
        int y2 = r * 31 + 10;
        int index = (log(tile[r][c]) - 1);
        lc4_draw_rect(x1 + 1, y1 + 1, 29, 29, color[index]);
        for (x = 0; x <= index/3; x++) {
          lc4_draw_seven_seg( offset[index/3][x] + x1, y2, WHITE, codes[index][x]);
        }
      }
    }
  }
}

void redraw ()
{
  // This function assumes that PennSim is being run in double buffered mode
  // In this mode we first clear the video memory buffer with lc4_reset_vmem,
  // then draw the scene, then call lc4_blt_vmem to swap the buffer to the screen
  // NOTE that you need to run PennSim with the following command:
  // java -jar PennSim.jar -d

  lc4_reset_vmem();

  drawTiles ();

  lc4_blt_vmem();
}

/*
 * #############  CODE THAT HANDLES GAME PLAY ######################
 */


void reset_game_state ()
{
  //reset everything to zero, then randomize first 2 tiles
  int i;
  int j;
  int k;
  int l;
  int a;
  int b;
  int twoOrFour1;
  int twoOrFour2;
  int newTile1 = 2;
  int newTile2 = 2;
  i = rand16() % 4; //addresses of where i will generate
  j = rand16() % 4;
  k = rand16() % 4;
  l = rand16() % 4;
  twoOrFour1 = rand16();
  twoOrFour2 = rand16();
  score = 0; //reset score

  while (i == k) {
    i = rand16() % 4;
  }
  while (j == l) {
    j = rand16() % 4;
  }

  //reset all
  for(a = 0; a < 4; a++) {
    for(b = 0; b < 4; b++) {
      tile[a][b] = 0;
    }
  }

  if(twoOrFour1 == 4 || twoOrFour1 == 9) {
    newTile1 = 4;
  }

  if(twoOrFour2 == 7|| twoOrFour2 == 12) {
    newTile2 = 4;
  }

  tile[i][j] = newTile1; //draws the new tiles randomly
  tile[k][l] = newTile2;



  drawTiles();
  
}

void swap() {
  int r;
  int c;
  int temp;
  int temp2;
  for(c = 0; c < 4; c++) {
    temp = tile[c][0];
    tile[c][0] = tile[c][3];
    tile[c][3] = temp;
    temp2 = tile[c][1];
    tile[c][1] = tile[c][2];
    tile[c][2] = temp2;
  }
}


// basic routine to merge four tile values
void mergeTiles (int *a) {
  int i;
  int merge[4];
  int resetLast;
  resetLast = 0;

  for (i = 0; i < 4; i++) { //get dereferenced value from memory
    merge[i] = *(a + i);
  }

  for (i = 0; i < 4; i++) { //check neighbor. If neighbor is = to value, merge, otherwise check if it's a zero. If it's a zero, check the value after that
    if (merge[i] != 0) {
      if(i < 3) {
        if (merge[i + 1] == merge[i]) { //if the immediate neighbor equals the current value
          merge[i] *= 2;
          merge[i + 1] = 0;
        } else if (merge[i + 1] == 0) { //check two away
          if (i < 2) {
            if (merge[i + 2] == merge[i]) {
              merge[i] *= 2;
              merge[i + 2] = 0;
            } else if (merge[i + 2] == 0) { //check three away
              if (i < 1) {
                if (merge[i + 3] == merge[i]) {
                  merge[i] *= 2;
                  merge[i + 3] = 0;
                }
              }
            }
          }
        }
      }
    }
  }

  //if there is a zero, shift it over one space
  //iterate through. every time there is a zero, take value from before, and move it over one
  for(i = 0; i < 4; i++) {
    if(merge[i] == 0) {
      if(i < 3) {
        if(merge[i + 1] != 0) { //check to see if immediate neighbor is 0
          merge[i] = merge[i + 1]; //shift over
          merge[i + 1] = 0; //zero out
        } else if (i < 2) { //check neighbor 2 away
           if(merge[i + 2] != 0) {
              merge[i] = merge[i + 2];
              merge[i + 2] = 0;
           } else if (i < 1) { //check neighbor 3 away
              merge[i] = merge[i + 3];
              merge[i + 3] = 0;
           }
       }
      } 
    }
  }
  if (resetLast) {
    merge[3] = 0; //we shifted the last value, so reset this to zero
  }

  for(i = 0; i < 4; i++) { 
    *(a + i) = merge[i];
  }
}

void checkWinOrLose() {
  int i;
  int j;
  int lose;
  lose = 1;
  
  for(i = 0; i <4; i++) {
    for(j = 0; j <4; j++) {
      if (tile[i][j] == 2048) {
          lc4_puts((lc4uint*)"\nYOU WON!\n");
          lc4_puts((lc4uint*)"\nFinal Score:");
          printnum(score);
          break;
      }
      if(tile[i][j] == 0) {
        lose = 0;
      } else if(i < 4) {
         if(tile[i][j] == tile[i+1][j]) { //if any two numbers adjacent are the same then we haven't lost
          lose = 0;
        } if (j < 4) {
            if(tile[i][j] == tile[i][j+1]) {
              lose = 0;
          }
        }
      }
    }
  }

  if(lose) {
    lc4_puts((lc4uint*)"\nYOU LOST!\n");
  }
}

void rotateCCW () {
  int r;
  int c;
  int tileCopy[4][4];
  for (r = 0; r < 4; r++) {
    for(c = 0; c < 4; c++) {
      tileCopy[r][c] = tile[r][c];
    }
  }
  for(r = 0; r < 4; r++) {
    for(c = 0; c < 4; c++) {
      tile[r][c] = tileCopy[c][3 - r];
    }
  }
}

void rotateCW () {
  int r;
  int c;
  int tileCopy[4][4];
  for (r = 0; r < 4; r++) {
    for(c = 0; c < 4; c++) {
      tileCopy[r][c] = tile[r][c];
    }
  }
  for(r = 0; r < 4; r++) {
    for(c = 0; c < 4; c++) {
      tile[c][r] = tileCopy[3 - r][c];
    }
  }
}

void iterateThrough() {
int i;
int *ptr;
  for(i = 0; i < 4; i++) { 
      ptr = tile[i];
      mergeTiles(ptr);
  }
}

void spawnTile(int beforeMove[4][4]) {
  int i;
  int j;
  int spawn;
  int r;
  int newTile = 2;
  int randx;
  int randy;
  r = rand16();
  randx = rand16() % 4;
  randy = rand16() % 4;
  spawn = 0;
  //check to see if the board has changed. If it hasn't, don't spawn a tile
  for(i = 0; i < 4; i++) {
    for(j = 0; j < 4; j++) {
      if(beforeMove[i][j] != tile[i][j]) { //spawn if different
        spawn = 1;
      }
    }
  }
  if(spawn) {
    //check value of rand, determine if it should be a 4
    if(r == 3 || r == 7) {
      newTile = 4;
    }

    //check if open spot at a random place
    while(tile[randx][randy] != 0) {
      randx = rand16() % 4;
      randy = rand16() % 4;
    }
    tile[randx][randy] = newTile;
    score += newTile;
  }
}


void update_game_state (lc4uint key) {

  //copy tiles into a copy so that you can compare before/after a keypress
  int i;
  int j;
  int beforeMove[4][4];
  for(i = 0; i < 4; i++) {
    for(j = 0; j < 4; j++) {
      beforeMove[i][j] = tile[i][j];
    }
  }
//rotate tiles
    if (key == 'j') { //left 
      iterateThrough();
      spawnTile(beforeMove);
      checkWinOrLose();
    } else if (key == 'k') { //down 
      rotateCW();
      iterateThrough();
      rotateCCW();
      spawnTile(beforeMove);
      checkWinOrLose();
    } else if (key == 'l') { //right 
      swap();
      iterateThrough();
      swap();
      spawnTile(beforeMove);
      checkWinOrLose();
    } else if (key == 'i') { //up
      rotateCCW();
      iterateThrough();
      rotateCW();
      spawnTile(beforeMove);
      checkWinOrLose();
    } else if (key == 'q') {
      reset_game_state();
    }
}

/*
 * #############  MAIN PROGRAM ######################
 */

int main ()
{
  lc4uint key;

  lc4_puts ((lc4uint*)"!!! Welcome to 2048 !!!\n");
  lc4_puts ((lc4uint*)"Press i to slide up\n");
  lc4_puts ((lc4uint*)"Press k to slide down\n");
  lc4_puts ((lc4uint*)"Press j to slide left\n");
  lc4_puts ((lc4uint*)"Press l to slide right\n");
  lc4_puts ((lc4uint*)"Press q to reset\n");

  reset_game_state();

  redraw ();

  while (1) {
    key = lc4_wait_for_char();

    update_game_state(key);
    lc4_puts((lc4uint*)"\nYour score: ");
    printnum(score);

    redraw ();

  }

  return 0;
}

