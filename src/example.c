#include <stdio.h>
#include <stdlib.h>
#include "font.h"

static int access_bit(char *data, int num)
{
    int base = num / 8;
    int shift = num % 8;

    return (data[base] >> (7 - shift)) & 0x1;
}

static void matrix(char *data, int width, int height)
{
    int i, j;

    for (j = 0; j < height; j++) {
        for (i = 0; i < width; i++) {
            if (access_bit(data, j * width + i)) {
                printf("0");
            } else {
                printf(".");
            }
        }
        printf("\n");
    }
}

int main(int argc, char **argv)
{
    FILE *fp = fopen(argv[1], "rb");
    if (fp == NULL) {
        return -1;
    }

    fseek(fp, 0, SEEK_END);
    size_t filesize = ftell(fp);
    fseek(fp, 0, SEEK_SET);

    char *buf = malloc(filesize);
    fread(buf, filesize, 1, fp);

    font_file_hdr_t *fileHdr = (void *)buf;
    font_char_hdr_t *charHdr = (void *)(buf + sizeof(font_file_hdr_t));
    char *data = (void *)(buf + sizeof(font_file_hdr_t) + fileHdr->number * sizeof(font_char_hdr_t));
    printf("fileHdr->version:%u\n", fileHdr->version);
    printf("fileHdr->endian:%u\n", fileHdr->endian);
    printf("fileHdr->number:%u\n", fileHdr->number);

    int i;
    for (i = 0; i < fileHdr->number; i++) {
        printf("charHdr[%d].code:0x%x\n", i, charHdr[i].code);
        printf("charHdr[%d].width:%u\n", i, charHdr[i].width);
        printf("charHdr[%d].height:%u\n", i, charHdr[i].height);
        printf("charHdr[%d].offset:%u\n", i, charHdr[i].offset);

        matrix(&data[charHdr[i].offset], charHdr[i].width, charHdr[i].height);
    }

    fclose(fp);
    return 0;
}