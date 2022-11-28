import java.util.Iterator;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Generator {
    public static List<String> foo() {
        List<String> result = new LinkedList<String>();
        result.add("alpha");
        result.add("beta");
        return result;
    }

    public static List<String> bar() {
        List<String> result = new LinkedList<String>();
        result.add("gamma");
        result.add("delta");
        return result;
    }

    public static List<String> fooOrBar() {
        List<String> result = new LinkedList<String>();
        result.addAll(foo());
        result.addAll(bar());
        return result;
    }
    
    public static void main(String[] args) {
        for (String element : fooOrBar()) {
            System.out.println(element);
        }
        // int value = Math.min(3, 4);
        // // each element is one solution
        // List<String> strings = new LinkedList<String>();
        // strings.add("foo");
        // strings.add("bar");
        // for (String element : strings) {
        //     System.out.println(element);
        // }
        // Iterator<String> stringIterator =
        //     strings.iterator();
        // while (stringIterator.hasNext()) {
        //     String element = stringIterator.next();
        //     System.out.println(element);
        // }
    }
}

