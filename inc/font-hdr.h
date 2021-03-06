#ifndef _FONT_HDR_H_
#define _FONT_HDR_H_

#include <stdint.h>

#pragma pack(1)

typedef struct {
    uint8_t version;
    uint8_t endian;
    uint32_t number;
} font_file_hdr_t;

typedef struct {
    uint8_t width;
    uint8_t height;
    uint32_t code;
    uint32_t offset;
} font_char_hdr_t;

#pragma pack()

#endif /* _FONT_HDR_H_ */