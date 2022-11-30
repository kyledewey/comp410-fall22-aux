public class EmptyIterator<A> extends Iterator<A> {
    public boolean hasNext() { return false; }
    public A next() {
        throw new UnsupportedOperationException();
    }
}
