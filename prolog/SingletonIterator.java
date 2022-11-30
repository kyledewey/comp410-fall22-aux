public class SingletonIterator<A> extends Iterator<A> {
    private A a;
    private boolean hasElement;
    
    public SingletonIterator(A a) {
        this.a = a;
        hasElement = true;
    }

    public boolean hasNext() {
        return hasElement;
    }

    public A next() {
        if (hasElement) {
            hasElement = false;
            return a;
        } else {
            throw new UnsupportedOperationException();
        }
    }
}
