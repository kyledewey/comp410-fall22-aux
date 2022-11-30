public class OrIterator<A> extends Iterator<A> {
    private Iterator<A> left;
    private boolean onLeft;
    private Iterator<A> right;

    public OrIterator(Iterator<A> left,
                      Iterator<A> right) {
        this.left = left;
        onLeft = true;
        this.right = right;
    }

    public boolean hasNext() {
        return left.hasNext() || right.hasNext();
    }

    public A next() {
        if (onLeft) {
            if (left.hasNext()) {
                return left.next();
            } else {
                onLeft = false;
            }
        }
        return right.next();
    }
}
