import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import linked.ListaLigada;

public class App {
    @SuppressWarnings("CallToPrintStackTrace")
    public static void main(String[] args) {
        ListaLigada lista = new ListaLigada(); 
        
        try {
            try (BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\mclar\\Documents\\Analise de Desempenho - Codigo\\atv1\\src\\arq.txt")) // só mudar o arquivo aqui
            ) {
                String linha;
                int contagemLinhas = 0;
                
                while ((linha = reader.readLine()) != null) {

                    if (linha.trim().isEmpty()) {
                        continue;
                    }

                    contagemLinhas++;
                    if (contagemLinhas == 1) {
                        String[] valores = linha.split(" ");
                        for (String valor : valores) {
                            lista.insereElemento(Integer.parseInt(valor));
                        }
                    } else if (contagemLinhas > 2) {
                        String[] partes = linha.split(" ");
                        char acao = partes[0].charAt(0);
                        switch (acao) {
                            case 'P' -> {
                                System.out.println("Lista atual: " + lista.toString());
                            }
                            case 'A' ->                             {
                                int numero = Integer.parseInt(partes[1]);
                                int posicao = Integer.parseInt(partes[2]);
                                lista.insereElementoPosicao(numero, posicao);
                            }
                            case 'R' ->                             {
                                int num = Integer.parseInt(partes[1]);
                                lista.remove(num);
                            }
                            default -> {
                            }
                        }
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

