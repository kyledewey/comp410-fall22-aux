public abstract class Iterator<A> {
    public abstract boolean hasNext();
    public abstract A next();

    public Iterator<A> append(Iterator<A> other) {
        return new OrIterator<A>(this, other);
    }

    public static Iterator<A> fail() {
        return new EmptyIterator<A>();
    }

    public static Iterator<A> singleton(A a) {
        return new SingletonIterator<A>(a);
    }
}
