#ifndef REPORT_BUFFER_LAB_H
#define REPORT_BUFFER_LAB_H

#include <stddef.h>
#include <stdio.h>

#define LAB_MAX_RECORDS 16
#define LAB_MAX_NAME_LEN 32
#define LAB_MAX_CATEGORY_LEN 16
#define LAB_MAX_LINE_LEN 128
#define LAB_REPORT_CAPACITY 4096

struct order_record {
	char name[LAB_MAX_NAME_LEN];
	int quantity;
	int unit_price;
	char category[LAB_MAX_CATEGORY_LEN];
	int total_price;
};

struct lab_stats {
	size_t records_loaded;
	size_t input_reads;
	size_t output_writes;
	size_t longest_name;
	int grand_total;
	int max_total;
};

int load_orders(FILE *in, struct order_record records[], size_t capacity, struct lab_stats *stats);
int build_report(const struct order_record records[], size_t count, const struct lab_stats *stats,
		 char *out, size_t out_size);

#endif
