#ifndef _FONT_H_
#define _FONT_H_

#include <stdint.h>

typedef struct {
    uint32_t version;
    uint32_t endian;
    uint32_t number;
} font_mod_hdr_t;

typedef struct {
    uint8_t width;
    uint8_t height;
    uint16_t code;
    uint32_t offset;
} font_chr_info_t;

#endif /* _FONT_H_ */