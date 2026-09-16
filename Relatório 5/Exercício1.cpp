#include <iostream>
using namespace std;

int combinar_equipes(int n) {

    if (n == 0) {
        return 0;
    } 
    else if (n == 1) {
        return 1;
    } 
    else {
        return combinar_equipes(n - 1) + combinar_equipes(n - 2);
    }
}

int main() {

    int n;
    cout << "Digite o tamanho do chaveamento(n): ";
    cin >> n;

    int total_cenarios = combinar_equipes(n);

    cout << "Total de cenarios de confrontos possiveis: " << total_cenarios << endl;

    return 0;
}