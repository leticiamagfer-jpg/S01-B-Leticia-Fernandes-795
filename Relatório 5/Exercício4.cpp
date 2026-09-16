#include <iostream>
#include <iomanip>
using namespace std;

int main() {

    int matriz_solar[5][5] = {0};
    int opcao;

    do {

        cout << "TELEMETRIA DO PAINEL SOLAR" << endl;
        cout << "1. Ativar Celula" << endl;
        cout << "2. Ver Mapa da Matriz" << endl;
        cout << "3. Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch(opcao){
            case 1: {
                int f, c;
                cout << "Digite a fileira (0-4): ";
                cin >> f;
                cout << "Digite a coluna (0-4): ";
                cin >> c;

                if (f >= 0 && f < 5 && c >= 0 && c < 5) {
                    if (matriz_solar[f][c] == 0) {
                        matriz_solar[f][c] = 1;
                        cout << "Sucesso: Celula solar ativada!" << endl;
                    } else {
                        cout << "Erro: Celula solar ja esta em operacao!" << endl;
                    }
                } else {
                    cout << "Erro: Indice fora do intervalo!" << endl;
                }
                break;
            }
            case 2: {
                cout << "Mapa da Matriz Solar" << endl;
                for (int i = 0; i < 5; i++) {
                    for (int j = 0; j < 5; j++) {
                        cout << "[" << matriz_solar[i][j] << "] ";
                    }
                    cout << endl;
                }
                break;
            }
            case 3:
                break;
            default:
                cout << "Opcao invalida! Tente novamente." << endl;
        }
    } while (opcao != 3);

    // relat. final
    int ativos = 0, inativos = 0;

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (matriz_solar[i][j] == 1) {
                ativos++;
            } else {
                inativos++;
            }
        }
    }

    double percentual = (ativos * 100.0) / 25.0;

    cout << "RELATORIO FINAL DE OPERACAO" << endl;
    cout << "Total de celulas ATIVAS: " << ativos << endl;
    cout << "Total de celulas INATIVAS: " << inativos << endl;
    cout << "Capacidade Operacional: " << fixed << setprecision(2) << percentual << "%" << endl;

    return 0;
}