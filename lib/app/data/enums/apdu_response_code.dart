class ApduResponseCode {
  final List<int?> sw;

  ApduResponseCode(this.sw);

  String getText() {
    if (sw[0] == 0x6) return 'Class not supported.';
    if (sw[0] == 0x61) return 'Response bytes still available';
    if (sw[0] == 0x61 && sw[1] != null) {
      return 'Command successfully executed; ${sw[1]} bytes of data are available and can be requested using GET RESPONSE.';
    }
    if (sw[0] == 0x62) return 'State of non-volatile memory unchanged';
    if (sw[0] == 0x62 && sw[1] == 0x0) {
      return 'No information given (NV-Ram not changed)';
    }
    if (sw[0] == 0x62 && sw[1] == 0x1) return 'NV-Ram not changed 1.';
    if (sw[0] == 0x62 && sw[1] == 0x81) {
      return 'Part of returned data may be corrupted';
    }
    if (sw[0] == 0x62 && sw[1] == 0x82) {
      return 'End of file/record reached before reading Le bytes';
    }
    if (sw[0] == 0x62 && sw[1] == 0x83) return 'Selected file invalidated';
    if (sw[0] == 0x62 && sw[1] == 0x84) {
      return 'Selected file is not valid. FCI not formated according to ISO';
    }
    if (sw[0] == 0x62 && sw[1] == 0x85) {
      return 'No input data available from a sensor on the card. No Purse Engine enslaved for R3bc';
    }
    if (sw[0] == 0x62 && sw[1] == 0xA2) return 'Wrong R-MAC';
    if (sw[0] == 0x62 && sw[1] == 0xA4) return 'Card locked (during reset( ))';
    // if(sw[0]==0x62&&sw[1]==0xCX)return 'Counter with value x (command dependent)';
    if (sw[0] == 0x62 && sw[1] == 0xF1) return 'Wrong C-MAC';
    if (sw[0] == 0x62 && sw[1] == 0xF3) return 'Internal reset';
    if (sw[0] == 0x62 && sw[1] == 0xF5) return 'Default agent locked';
    if (sw[0] == 0x62 && sw[1] == 0xF7) return 'Cardholder locked';
    if (sw[0] == 0x62 && sw[1] == 0xF8) return 'Basement is current agent';
    if (sw[0] == 0x62 && sw[1] == 0xF9) return 'CALC Key Set not unblocked';
    if (sw[0] == 0x62 && sw[1] != null) return '–';
    if (sw[0] == 0x62 && sw[1] != null) return 'RFU';
    if (sw[0] == 0x63) return 'State of non-volatile memory changed';
    if (sw[0] == 0x63 && sw[1] == 0x0) {
      return 'No information given (NV-Ram changed)';
    }
    if (sw[0] == 0x63 && sw[1] == 0x81) {
      return 'File filled up by the last write. Loading/updating is not allowed.';
    }
    if (sw[0] == 0x63 && sw[1] == 0x82) return 'Card key not supported.';
    if (sw[0] == 0x63 && sw[1] == 0x83) return 'Reader key not supported.';
    if (sw[0] == 0x63 && sw[1] == 0x84) {
      return 'Plaintext transmission not supported.';
    }
    if (sw[0] == 0x63 && sw[1] == 0x85) {
      return 'Secured transmission not supported.';
    }
    if (sw[0] == 0x63 && sw[1] == 0x86) {
      return 'Volatile memory is not available.';
    }
    if (sw[0] == 0x63 && sw[1] == 0x87) {
      return 'Non-volatile memory is not available.';
    }
    if (sw[0] == 0x63 && sw[1] == 0x88) return 'Key number not valid.';
    if (sw[0] == 0x63 && sw[1] == 0x89) return 'Key length is not correct.';
    if (sw[0] == 0x63 && sw[1] == 0xC0) return 'Verify fail, no try left.';
    if (sw[0] == 0x63 && sw[1] == 0xC1) return 'Verify fail, 1 try left.';
    if (sw[0] == 0x63 && sw[1] == 0xC2) return 'Verify fail, 2 tries left.';
    if (sw[0] == 0x63 && sw[1] == 0xC3) return 'Verify fail, 3 tries left.';
    if (sw[0] == 0x63 && sw[1] != null) {
      return 'The counter has reached the value ${sw[1]} (0 = x = 15) (command dependent).';
    }
    if (sw[0] == 0x63 && sw[1] == 0xF1) return 'More data expected.';
    if (sw[0] == 0x63 && sw[1] == 0xF2) {
      return 'More data expected and proactive command pending.';
    }
    if (sw[0] == 0x63 && sw[1] != null) return '–';
    if (sw[0] == 0x63 && sw[1] != null) return 'RFU';
    if (sw[0] == 0x64) return 'State of non-volatile memory unchanged';
    if (sw[0] == 0x64 && sw[1] == 0x0) {
      return 'No information given (NV-Ram not changed)';
    }
    if (sw[0] == 0x64 && sw[1] == 0x1) {
      return 'Command timeout. Immediate response required by the card.';
    }
    if (sw[0] == 0x64 && sw[1] != null) return 'RFU';
    if (sw[0] == 0x65) return 'State of non-volatile memory changed';
    if (sw[0] == 0x65 && sw[1] == 0x0) return 'No information given';
    if (sw[0] == 0x65 && sw[1] == 0x1) {
      return 'Write error. Memory failure. There have been problems in writing or reading the EEPROM. Other hardware problems may also bring this error.';
    }
    if (sw[0] == 0x65 && sw[1] == 0x81) return 'Memory failure';
    if (sw[0] == 0x65 && sw[1] != null) return '–';
    if (sw[0] == 0x65 && sw[1] != null) return 'RFU';
    if (sw[0] == 0x66) return '';
    if (sw[0] == 0x66 && sw[1] == 0x0) return 'Error while receiving (timeout)';
    if (sw[0] == 0x66 && sw[1] == 0x1) {
      return 'Error while receiving (character parity error)';
    }
    if (sw[0] == 0x66 && sw[1] == 0x2) return 'Wrong checksum';
    if (sw[0] == 0x66 && sw[1] == 0x3) return 'The current DF file without FCI';
    if (sw[0] == 0x66 && sw[1] == 0x4) {
      return 'No SF or KF under the current DF';
    }
    if (sw[0] == 0x66 && sw[1] == 0x69) {
      return 'Incorrect Encryption/Decryption Padding';
    }
    if (sw[0] == 0x66 && sw[1] != null) return '–';
    if (sw[0] == 0x67) return '';
    if (sw[0] == 0x67 && sw[1] == 0x0) return 'Wrong length';
    if (sw[0] == 0x67 && sw[1] != null) {
      return 'length incorrect (procedure)(ISO 7816-3)';
    }
    if (sw[0] == 0x68) return 'Functions in CLA not supported';
    if (sw[0] == 0x68 && sw[1] == 0x0) {
      return 'No information given (The request function is not supported by the card)';
    }
    if (sw[0] == 0x68 && sw[1] == 0x81) return 'Logical channel not supported';
    if (sw[0] == 0x68 && sw[1] == 0x82) return 'Secure messaging not supported';
    if (sw[0] == 0x68 && sw[1] == 0x83) {
      return 'Last command of the chain expected';
    }
    if (sw[0] == 0x68 && sw[1] == 0x84) return 'Command chaining not supported';
    if (sw[0] == 0x68 && sw[1] != null) return '–';
    if (sw[0] == 0x68 && sw[1] != null) return 'RFU';
    if (sw[0] == 0x69 && sw[1] == 0x0) {
      return 'No information given (Command not allowed)';
    }
    if (sw[0] == 0x69 && sw[1] == 0x1) {
      return 'Command not accepted (inactive state)';
    }
    if (sw[0] == 0x69 && sw[1] == 0x81) {
      return 'Command incompatible with file structure';
    }
    if (sw[0] == 0x69 && sw[1] == 0x82) {
      return 'Security condition not satisfied.';
    }
    if (sw[0] == 0x69 && sw[1] == 0x83) return 'Authentication method blocked';
    if (sw[0] == 0x69 && sw[1] == 0x84) {
      return 'Referenced data reversibly blocked (invalidated)';
    }
    if (sw[0] == 0x69 && sw[1] == 0x85) {
      return 'Conditions of use not satisfied.';
    }
    if (sw[0] == 0x69 && sw[1] == 0x86) {
      return 'Command not allowed (no current EF)';
    }
    if (sw[0] == 0x69 && sw[1] == 0x87) {
      return 'Expected secure messaging (SM) object missing';
    }
    if (sw[0] == 0x69 && sw[1] == 0x88) {
      return 'Incorrect secure messaging (SM) data object';
    }
    if (sw[0] == 0x69 && sw[1] == 0x8D) return 'Reserved';
    if (sw[0] == 0x69 && sw[1] == 0x96) return 'Data must be updated again';
    if (sw[0] == 0x69 && sw[1] == 0xE1) {
      return 'POL1 of the currently Enabled Profile prevents this action.';
    }
    if (sw[0] == 0x69 && sw[1] == 0xF0) return 'Permission Denied';
    if (sw[0] == 0x69 && sw[1] == 0xF1) {
      return 'Permission Denied – Missing Privilege';
    }
    if (sw[0] == 0x69 && sw[1] != null) return '–';
    if (sw[0] == 0x69 && sw[1] != null) return 'RFU';
    if (sw[0] == 0x6A && sw[1] == 0x0) {
      return 'No information given (Bytes P1 and/or P2 are incorrect)';
    }
    if (sw[0] == 0x6A && sw[1] == 0x80) {
      return 'The parameters in the data field are incorrect.';
    }
    if (sw[0] == 0x6A && sw[1] == 0x81) return 'Function not supported';
    if (sw[0] == 0x6A && sw[1] == 0x82) return 'File not found';
    if (sw[0] == 0x6A && sw[1] == 0x83) return 'Record not found';
    if (sw[0] == 0x6A && sw[1] == 0x84) {
      return 'There is insufficient memory space in record or file';
    }
    if (sw[0] == 0x6A && sw[1] == 0x85) {
      return 'Lc inconsistent with TLV structure';
    }
    if (sw[0] == 0x6A && sw[1] == 0x86) return 'Incorrect P1 or P2 parameter.';
    if (sw[0] == 0x6A && sw[1] == 0x87) return 'Lc inconsistent with P1-P2';
    if (sw[0] == 0x6A && sw[1] == 0x88) return 'Referenced data not found';
    if (sw[0] == 0x6A && sw[1] == 0x89) return 'File already exists';
    if (sw[0] == 0x6A && sw[1] == 0x8A) return 'DF name already exists.';
    if (sw[0] == 0x6A && sw[1] == 0xF0) return 'Wrong parameter value';
    if (sw[0] == 0x6A && sw[1] != null) return '–';
    if (sw[0] == 0x6A && sw[1] != null) return 'RFU';
    if (sw[0] == 0x6B) return '';
    if (sw[0] == 0x6B && sw[1] == 0x0) return 'Wrong parameter(s) P1-P2';
    if (sw[0] == 0x6B && sw[1] != null) {
      return 'Reference incorrect (procedure byte), (ISO 7816-3)';
    }
    if (sw[0] == 0x6C) return 'Wrong length Le';
    if (sw[0] == 0x6C && sw[1] == 0x0) return 'Incorrect P3 length.';
    if (sw[0] == 0x6C && sw[1] != null) {
      return 'Bad length value in Le; ‘xx’ is the correct exact Le';
    }
    if (sw[0] == 0x6D) return '';
    if (sw[0] == 0x6D && sw[1] == 0x0) {
      return 'Instruction code not supported or invalid';
    }
    if (sw[0] == 0x6D && sw[1] != null) {
      return 'Instruction code not programmed or invalid (procedure byte), (ISO 7816-3)';
    }
    if (sw[0] == 0x6E) return '';
    if (sw[0] == 0x6E && sw[1] == 0x0) return 'Class not supported';
    if (sw[0] == 0x6E && sw[1] != null) {
      return 'Instruction class not supported (procedure byte), (ISO 7816-3)';
    }
    if (sw[0] == 0x6F) return 'Internal exception';
    if (sw[0] == 0x6F && sw[1] == 0x0) {
      return 'Command aborted – more exact diagnosis not possible (e.g., operating system error).';
    }
    if (sw[0] == 0x6F && sw[1] == 0xFF) return 'Card dead (overuse, …)';
    if (sw[0] == 0x6F && sw[1] != null) {
      return 'No precise diagnosis (procedure byte), (ISO 7816-3)';
    }
    // if(sw[0]==0x9/)return '';
    if (sw[0] == 0x90 && sw[1] == 0x0) {
      return 'Command successfully executed (OK).';
    }
    if (sw[0] == 0x90 && sw[1] == 0x4) {
      return 'PIN not succesfully verified, 3 or more PIN tries left';
    }
    if (sw[0] == 0x90 && sw[1] == 0x8) return 'Key/file not found';
    if (sw[0] == 0x90 && sw[1] == 0x80) {
      return 'Unblock Try Counter has reached zero';
    }
    if (sw[0] == 0x91 && sw[1] == 0x0) return 'OK';
    if (sw[0] == 0x91 && sw[1] == 0x1) {
      return 'States.activity, States.lock Status or States.lockable has wrong value';
    }
    if (sw[0] == 0x91 && sw[1] == 0x2) {
      return 'Transaction number reached its limit';
    }
    if (sw[0] == 0x91 && sw[1] == 0x0C) return 'No changes';
    if (sw[0] == 0x91 && sw[1] == 0x0E) {
      return 'Insufficient NV-Memory to complete command';
    }
    if (sw[0] == 0x91 && sw[1] == 0x1C) return 'Command code not supported';
    if (sw[0] == 0x91 && sw[1] == 0x1E) return 'CRC or MAC does not match data';
    if (sw[0] == 0x91 && sw[1] == 0x40) return 'Invalid key number specified';
    if (sw[0] == 0x91 && sw[1] == 0x7E) {
      return 'Length of command string invalid';
    }
    if (sw[0] == 0x91 && sw[1] == 0x9D) {
      return 'Not allow the requested command';
    }
    if (sw[0] == 0x91 && sw[1] == 0x9E) return 'Value of the parameter invalid';
    if (sw[0] == 0x91 && sw[1] == 0xA0) {
      return 'Requested AID not present on PICC';
    }
    if (sw[0] == 0x91 && sw[1] == 0xA1) {
      return 'Unrecoverable error within application';
    }
    if (sw[0] == 0x91 && sw[1] == 0xAE) {
      return 'Authentication status does not allow the requested command';
    }
    if (sw[0] == 0x91 && sw[1] == 0xAF) {
      return 'Additional data frame is expected to be sent';
    }
    if (sw[0] == 0x91 && sw[1] == 0xBE) return 'Out of boundary';
    if (sw[0] == 0x91 && sw[1] == 0xC1) {
      return 'Unrecoverable error within PICC';
    }
    if (sw[0] == 0x91 && sw[1] == 0xCA) {
      return 'Previous Command was not fully completed';
    }
    if (sw[0] == 0x91 && sw[1] == 0xCD) {
      return 'PICC was disabled by an unrecoverable error';
    }
    if (sw[0] == 0x91 && sw[1] == 0xCE) {
      return 'Number of Applications limited to 28';
    }
    if (sw[0] == 0x91 && sw[1] == 0xDE) {
      return 'File or application already exists';
    }
    if (sw[0] == 0x91 && sw[1] == 0xEE) {
      return 'Could not complete NV-write operation due to loss of power';
    }
    if (sw[0] == 0x91 && sw[1] == 0xF0) {
      return 'Specified file number does not exist';
    }
    if (sw[0] == 0x91 && sw[1] == 0xF1) {
      return 'Unrecoverable error within file';
    }
    if (sw[0] == 0x92 && sw[1] != null) {
      return 'Writing to EEPROM successful after ${sw[1]} attempts.';
    }
    if (sw[0] == 0x92 && sw[1] == 0x10) {
      return 'Insufficient memory. No more storage available.';
    }
    if (sw[0] == 0x92 && sw[1] == 0x40) {
      return 'Writing to EEPROM not successful.';
    }
    if (sw[0] == 0x93 && sw[1] == 0x1) return 'Integrity error';
    if (sw[0] == 0x93 && sw[1] == 0x2) return 'Candidate S2 invalid';
    if (sw[0] == 0x93 && sw[1] == 0x3) {
      return 'Application is permanently locked';
    }
    if (sw[0] == 0x94 && sw[1] == 0x0) return 'No EF selected.';
    if (sw[0] == 0x94 && sw[1] == 0x1) {
      return 'Candidate currency code does not match purse currency';
    }
    if (sw[0] == 0x94 && sw[1] == 0x2) return 'Candidate amount too high';
    if (sw[0] == 0x94 && sw[1] == 0x2) return 'Address range exceeded.';
    if (sw[0] == 0x94 && sw[1] == 0x3) return 'Candidate amount too low';
    if (sw[0] == 0x94 && sw[1] == 0x4) {
      return 'FID not found, record not found or comparison pattern not found.';
    }
    if (sw[0] == 0x94 && sw[1] == 0x5) return 'Problems in the data field';
    if (sw[0] == 0x94 && sw[1] == 0x6) return 'Required MAC unavailable';
    if (sw[0] == 0x94 && sw[1] == 0x7) {
      return 'Bad currency : purse engine has no slot with R3bc currency';
    }
    if (sw[0] == 0x94 && sw[1] == 0x8) {
      return 'R3bc currency not supported in purse engine';
    }
    if (sw[0] == 0x94 && sw[1] == 0x8) {
      return 'Selected file type does not match command.';
    }
    if (sw[0] == 0x95 && sw[1] == 0x80) return 'Bad sequence';
    if (sw[0] == 0x96 && sw[1] == 0x81) return 'Slave not found';
    if (sw[0] == 0x97 && sw[1] == 0x0) {
      return 'PIN blocked and Unblock Try Counter is 1 or 2';
    }
    if (sw[0] == 0x97 && sw[1] == 0x2) return 'Main keys are blocked';
    if (sw[0] == 0x97 && sw[1] == 0x4) {
      return 'PIN not succesfully verified, 3 or more PIN tries left';
    }
    if (sw[0] == 0x97 && sw[1] == 0x84) return 'Base key';
    if (sw[0] == 0x97 && sw[1] == 0x85) return 'Limit exceeded – C-MAC key';
    if (sw[0] == 0x97 && sw[1] == 0x86) {
      return 'SM error – Limit exceeded – R-MAC key';
    }
    if (sw[0] == 0x97 && sw[1] == 0x87) {
      return 'Limit exceeded – sequence counter';
    }
    if (sw[0] == 0x97 && sw[1] == 0x88) return 'Limit exceeded – R-MAC length';
    if (sw[0] == 0x97 && sw[1] == 0x89) return 'Service not available';
    if (sw[0] == 0x98 && sw[1] == 0x2) return 'No PIN defined.';
    if (sw[0] == 0x98 && sw[1] == 0x4) {
      return 'Access conditions not satisfied, authentication failed.';
    }
    if (sw[0] == 0x98 && sw[1] == 0x35) {
      return 'ASK RANDOM or GIVE RANDOM not executed.';
    }
    if (sw[0] == 0x98 && sw[1] == 0x40) {
      return 'PIN verification not successful.';
    }
    if (sw[0] == 0x98 && sw[1] == 0x50) {
      return 'INCREASE or DECREASE could not be executed because a limit has been reached.';
    }
    if (sw[0] == 0x98 && sw[1] == 0x62) {
      return 'Authentication Error, application specific (incorrect MAC)';
    }
    if (sw[0] == 0x99 && sw[1] == 0x0) return '1 PIN try left';
    if (sw[0] == 0x99 && sw[1] == 0x4) {
      return 'PIN not succesfully verified, 1 PIN try left';
    }
    if (sw[0] == 0x99 && sw[1] == 0x85) return 'Wrong status – Cardholder lock';
    if (sw[0] == 0x99 && sw[1] == 0x86) return 'Missing privilege';
    if (sw[0] == 0x99 && sw[1] == 0x87) return 'PIN is not installed';
    if (sw[0] == 0x99 && sw[1] == 0x88) return 'Wrong status – R-MAC state';
    if (sw[0] == 0x9A && sw[1] == 0x0) return '2 PIN try left';
    if (sw[0] == 0x9A && sw[1] == 0x4) {
      return 'PIN not succesfully verified, 2 PIN try left';
    }
    if (sw[0] == 0x9A && sw[1] == 0x71) {
      return 'Wrong parameter value – Double agent AID';
    }
    if (sw[0] == 0x9A && sw[1] == 0x72) {
      return 'Wrong parameter value – Double agent Type';
    }
    if (sw[0] == 0x9D && sw[1] == 0x5) return 'Incorrect certificate type';
    if (sw[0] == 0x9D && sw[1] == 0x7) return 'Incorrect session data size';
    if (sw[0] == 0x9D && sw[1] == 0x8) return 'Incorrect DIR file record size';
    if (sw[0] == 0x9D && sw[1] == 0x9) return 'Incorrect FCI record size';
    if (sw[0] == 0x9D && sw[1] == 0x0A) return 'Incorrect code size';
    if (sw[0] == 0x9D && sw[1] == 0x10) {
      return 'Insufficient memory to load application';
    }
    if (sw[0] == 0x9D && sw[1] == 0x11) return 'Invalid AID';
    if (sw[0] == 0x9D && sw[1] == 0x12) return 'Duplicate AID';
    if (sw[0] == 0x9D && sw[1] == 0x13) return 'Application previously loaded';
    if (sw[0] == 0x9D && sw[1] == 0x14) return 'Application history list full';
    if (sw[0] == 0x9D && sw[1] == 0x15) return 'Application not open';
    if (sw[0] == 0x9D && sw[1] == 0x17) return 'Invalid offset';
    if (sw[0] == 0x9D && sw[1] == 0x18) return 'Application already loaded';
    if (sw[0] == 0x9D && sw[1] == 0x19) return 'Invalid certificate';
    if (sw[0] == 0x9D && sw[1] == 0x1A) return 'Invalid signature';
    if (sw[0] == 0x9D && sw[1] == 0x1B) return 'Invalid KTU';
    if (sw[0] == 0x9D && sw[1] == 0x1D) return 'MSM controls not set';
    if (sw[0] == 0x9D && sw[1] == 0x1E) {
      return 'Application signature does not exist';
    }
    if (sw[0] == 0x9D && sw[1] == 0x1F) return 'KTU does not exist';
    if (sw[0] == 0x9D && sw[1] == 0x20) return 'Application not loaded';
    if (sw[0] == 0x9D && sw[1] == 0x21) {
      return 'Invalid Open command data length';
    }
    if (sw[0] == 0x9D && sw[1] == 0x30) {
      return 'Check data parameter is incorrect (invalid start address)';
    }
    if (sw[0] == 0x9D && sw[1] == 0x31) {
      return 'Check data parameter is incorrect (invalid length)';
    }
    if (sw[0] == 0x9D && sw[1] == 0x32) {
      return 'Check data parameter is incorrect (illegal memory check area)';
    }
    if (sw[0] == 0x9D && sw[1] == 0x40) {
      return 'Invalid MSM Controls ciphertext';
    }
    if (sw[0] == 0x9D && sw[1] == 0x41) return 'MSM controls already set';
    if (sw[0] == 0x9D && sw[1] == 0x42) {
      return 'Set MSM Controls data length less than 2 bytes';
    }
    if (sw[0] == 0x9D && sw[1] == 0x43) {
      return 'Invalid MSM Controls data length';
    }
    if (sw[0] == 0x9D && sw[1] == 0x44) return 'Excess MSM Controls ciphertext';
    if (sw[0] == 0x9D && sw[1] == 0x45) {
      return 'Verification of MSM Controls data failed';
    }
    if (sw[0] == 0x9D && sw[1] == 0x50) {
      return 'Invalid MCD Issuer production ID';
    }
    if (sw[0] == 0x9D && sw[1] == 0x51) return 'Invalid MCD Issuer ID';
    if (sw[0] == 0x9D && sw[1] == 0x52) {
      return 'Invalid set MSM controls data date';
    }
    if (sw[0] == 0x9D && sw[1] == 0x53) return 'Invalid MCD number';
    if (sw[0] == 0x9D && sw[1] == 0x54) return 'Reserved field error';
    if (sw[0] == 0x9D && sw[1] == 0x55) return 'Reserved field error';
    if (sw[0] == 0x9D && sw[1] == 0x56) return 'Reserved field error';
    if (sw[0] == 0x9D && sw[1] == 0x57) return 'Reserved field error';
    if (sw[0] == 0x9D && sw[1] == 0x60) return 'MAC verification failed';
    if (sw[0] == 0x9D && sw[1] == 0x61) {
      return 'Maximum number of unblocks reached';
    }
    if (sw[0] == 0x9D && sw[1] == 0x62) return 'Card was not blocked';
    if (sw[0] == 0x9D && sw[1] == 0x63) return 'Crypto functions not available';
    if (sw[0] == 0x9D && sw[1] == 0x64) return 'No application loaded';
    if (sw[0] == 0x9E && sw[1] == 0x0) return 'PIN not installed';
    if (sw[0] == 0x9E && sw[1] == 0x4) {
      return 'PIN not succesfully verified, PIN not installed';
    }
    if (sw[0] == 0x9F && sw[1] == 0x0) {
      return 'PIN blocked and Unblock Try Counter is 3';
    }
    if (sw[0] == 0x9F && sw[1] == 0x4) {
      return 'PIN not succesfully verified, PIN blocked and Unblock Try Counter is 3';
    }
    if (sw[0] == 0x9F && sw[1] != null) {
      return 'Command successfully executed; ‘xx’ bytes of data are available and can be requested using GET RESPONSE.';
    }
    // if(sw[0]==0x9x&&sw[1]!=null)return 'Application related status, (ISO 7816-3)';
    return 'SomeThingWhenWrong';
  }
}
