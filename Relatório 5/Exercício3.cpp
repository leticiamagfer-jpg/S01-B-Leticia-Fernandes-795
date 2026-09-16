#include <iostream>
using namespace std;

int main() {

    double max, carga = 0.0;
    int opcao;

    cout << "Informe a capacidade maxima de carga do drone (kg): ";

    cin >> max;

    do {
        
        cout << "Sistema de Carga do Drone" << endl
             << "1. Verificar Carga" << endl
             << "2. Carregar Pacote" << endl
             << "3. Descarregar Pacote" << endl
             << "4. Encerrar Operacao" << endl
             << "Escolha uma opcao: ";
        cin >> opcao;

        switch(opcao){
            case 1:
                cout << "Carga Atual: " << carga << " kg / " << max << " kg" << endl;
                cout << "Espaco Disponivel: " << (max - carga) << " kg" << endl;
                break;

            case 2: {
                double pesoPacote;
                cout << "Digite o peso do pacote a ser carregado (kg): ";
                cin >> pesoPacote;

                if (carga + pesoPacote > max) {
                    cout << "Alerta: Peso maximo de decolagem excedido! Operacao cancelada." << endl;
                } else {
                    carga += pesoPacote;
                    cout << "Pacote adicionado com sucesso!" << endl;
                }
                break;
            }

            case 3: {
                double pesoRemover;
                cout << "Digite o peso a ser removido (kg): ";
                cin >> pesoRemover;

                if (pesoRemover > carga) {
                    cout << "Alerta: Nao e possivel remover mais peso do que o carregado! Operacao cancelada." << endl;
                } else {
                    carga -= pesoRemover;
                    cout << "Pacote removido com sucesso!" << endl;
                }
                break;
            }

            case 4:
                cout << "Encerrando sistema de telemetria..." << endl;
                break;

            default:
                cout << "Opcao invalida! Tente novamente." << endl;
        }
    } while (opcao != 4);

    return 0;
}