#include <iostream>
#include <iomanip>
using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) {

    float confiabilidade = 1.0;

    for (int i = 0; i < tamanho; i++){
        confiabilidade *= probabilidades[i];
    }

    return confiabilidade;
}

int main(){

    int N;
    
    cout << "Digite o numero de componentes do sistema: ";
    
    cin >> N;

    float probabilidades[N];
    
    cout << "Digite as probabilidades de funcionamento de cada componente:" << endl;
    
    for (int i = 0; i < N; i++) {
        cout << "Componente " << (i + 1) << ": ";
        cin >> probabilidades[i];
    }

    float confiabilidade = calcular_confiabilidade_sistema(probabilidades, N);
    
    cout << setprecision(4) << fixed << "Confiabilidade total do sistema: " << confiabilidade;
    cout << setprecision(2) << fixed << " (" << confiabilidade * 100 << "%)" << endl;

    return 0;
}