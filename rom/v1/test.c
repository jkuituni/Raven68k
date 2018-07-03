#define   DUART_BASE   0xFF0000                                  /* Base of I/O port addresses */
#define   MR1A         (* (char *) (DUART_BASE+1) )              /* Mode register 1A */
#define   MR2A         (* (char *) (DUART_BASE+1) )              /* Mode register 2A */
#define   CSRA         (* (char *) (DUART_BASE+3) )              /* Clock Select register A */
#define   SRA          (* (char *) (DUART_BASE+3) )              /* Status Register A */
#define   CRA          (* (char *) (DUART_BASE+5) )              /* Command Register A */
#define   RBRA         (* (char *) (DUART_BASE+7) )              /* Receiver Buffer Register A */
#define   TBRA         (* (char *) (DUART_BASE+7) )              /* Transmitter Buffer Register A */
#define   ACR          (* (char *) (DUART_BASE+9) )              /* Auxiliary Control Register */

#define   RxRD         0x01                                      /* Receiver ready bit mask */
#define   TxRD         0x04                                      /* Transmitter ready bit mask */

void setup_duart(void) {
  CRA = 0x30;       /* Reset port A transmitter */
  CRA = 0x20;       /* Reset port A receiver */
  CRA = 0x10;       /* Reset port A mode register pointer */
  ACR = 0x00;       /* Select Baud rate Set 1 */
  CSRA = 0xBB;      /* Set both the Rx and Tx speeds to 9600 baud */
  MR1A = 0x93;      /* Port A 8 bits, no parity, 1 stop bit enable RxRTS output */
  MR2A = 0x37;      /* Normal operating mode, enable TxRTS, TxCTS, 1 stop bit */
  CRA = 0x25;       /* Enable port A transmitter and receiver */
}

char getch(void) {
  while ( (SRA & RxRD) == 0 ) ;
  return RBRA;
}

char putch(char c) {
  while ( (SRA & TxRD) == 0 ) ;
  TBRA = c;
}

void main(void) {
  char c;
  while (1) {
    c = getch();
    putch(c);
  }
}
