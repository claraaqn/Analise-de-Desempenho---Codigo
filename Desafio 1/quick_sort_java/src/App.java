import java.io.*;
import java.time.*;
import java.util.*;

public class App {
    public static void main(String[] args) {
        String fileName = "atv5 - Desafio 1/arq-desafio.txt";
        List<Integer> list = new ArrayList<>();
        
        // Leitura do arquivo
        try (Scanner sc = new Scanner(new File(fileName))) {
            while (sc.hasNextInt()) {
                list.add(sc.nextInt());
            }
        } catch (FileNotFoundException e) {
            System.err.println("Arquivo não encontrado!");
            return;
        }
        
        // Conversão para array
        int[] arr = list.stream().mapToInt(i -> i).toArray();
        
        Runtime runtime = Runtime.getRuntime();
        runtime.gc(); 
        long memoryBefore = runtime.totalMemory() - runtime.freeMemory();

        Instant start = Instant.now();
        Arrays.sort(arr);
        Instant end = Instant.now();

        long memoryAfter = runtime.totalMemory() - runtime.freeMemory();


        System.out.println("Tempo de execução: " + Duration.between(start, end).toMillis() + " ms");
        System.out.println("Uso de memória: " + (memoryAfter - memoryBefore) / 1024 + " KB");
    }
}
