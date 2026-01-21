#include <iostream>
#include <vector>
#include <fstream>
#include <sstream> 
#include <string>
using namespace std ;

void read_file(std::ifstream &read_file, vector<vector<int>>&matrix){
	string line ;
	int k=0 ;
	while(getline(read_file, line)) {
		vector<int> line_i ;

		istringstream str(line) ;
		int num ;

		while(str >> num){
			line_i.push_back(num) ;
		}
		k++ ;
		matrix.push_back(line_i) ;
		line_i.clear() ;
	}
	cout << k << endl ;
}

int main() {

	std::ifstream read_file_1;
	std::ifstream read_file_2;

	read_file_1.open("mat1.txt") ;
	read_file_2.open("mat2.txt"); 
	
	if(!(read_file_1.is_open())){
		cerr << "Error to open file_1 " << endl ;
	}

	if(!(read_file_2.is_open())){
		cerr<< "Error to open the file 2 " << endl ;
	}

	vector<vector<int>>matrix1 ;
	vector<vector<int>>matrix2 ;
	
	//read file 1 ;
	read_file(read_file_1, matrix1);
	read_file_1.close() ;
	
	//read_file_2 ;
	read_file(read_file_2, matrix2);
	read_file_2.close() ;

	for( int i=0 ; i<100 ; i++){
		for( int j=0 ; j<100 ; j++){
			cout << matrix1[i][j] << " ";
		}
		cout << endl ;
	}

	return 0 ;
}
