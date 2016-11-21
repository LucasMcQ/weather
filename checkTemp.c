#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>



float open_file(char*);
void print_float(float);
void execute_script();
int check_temp(float);

int main(int argc, char* argv[]){

	char *file_name = strdup(argv[1]);

	float temp = open_file(file_name);

	int is_100_deg = check_temp(temp);

	if(is_100_deg == 1){
		printf("Put on some sunscreen mate it's %f degrees out!\n", temp);
		execute_script();
	} // if
	else{
		printf("It's safe to go out side, it's only %f degrees out!\n", temp);
	} // else

} // main


float open_file(char* file_name){

	FILE *fp;
	
	fp = fopen(file_name, "r");

	if(fp == NULL){
		fprintf(stderr, "Error: Unable to open the file.\n");
	} // if

	float f = 0.0;

	fscanf(fp, "%f", &f);

	fclose(fp);	
	
	return f;
	
} // open_file


int check_temp(float temp){

	if(temp >= 100.0){
		return 1;
	} // if
	else{
		return 0;
	}

} // check_temp


void execute_script(){

	system("python LightsOn.py");	

} // execute_script


void print_float(float c){

	printf("%f", c);

} // print_char
