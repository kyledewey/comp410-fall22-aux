sealed trait Exp
case object True extends Exp
case object False extends Exp
case class If(e1: Exp, e2: Exp, e3: Exp) extends Exp
// case class BinaryOperationExp(e1: Exp, op: BOP, e2: Exp) extends Exp
case class Plus(e1: Exp, e2: Exp) extends Exp
case class Minus(e1: Exp, e2: Exp) extends Exp

// sealed trait BOP
// case object Plus extends BOP
// case object Minus extends BOP

object Main {
  def decBound(depth: Int): Iterator[Int] = {
    if (depth > 0) {
      Iterator(depth - 1)
    } else {
      Iterator()
    }
  }

  def exp(depth: Int): Iterator[Exp] = {
    // needed: base cases
    // and(exp(Depth), FUNCTION)
    // exp(Depth).flatMap(FUNCTION)
    Iterator(True, False) ++
    // depth: A (Int)
    // flatMap takes: Int => Iterator[Exp]
    // decBound(depth).flatMap(newDepth =>
    //   // Exp => Iterator[Exp]
    //   exp(newDepth).flatMap(e1 =>
    //     // Exp => Iterator[Exp]
    //     exp(newDepth).flatMap(e2 =>
    //       // Exp => Iterator[Exp]
    //       exp(newDepth).flatMap(e3 =>
    //         Iterator(If(e1, e2, e3))))))
    (for {
      newDepth <- decBound(depth)
      e1 <- exp(newDepth)
      e2 <- exp(newDepth)
      e3 <- exp(newDepth)
    } yield If(e1, e2, e3)) ++
    (for {
      newDepth <- decBound(depth)
      e1 <- exp(newDepth)
      e2 <- exp(newDepth)
      f <- Iterator(Plus.apply _, Minus.apply _)
    } yield f(e1, e2))
  }
  //   // function passed: Exp => Iterator[Exp]
  //   exp.flatMap(e1 =>
  //     // function passed: Exp => Iterator[Exp]
  //     exp.flatMap(e2 =>
  //       // function passed: Exp => Iterator[Exp]
  //       exp.flatMap(e3 =>
  //         Iterator(If(e1, e2, e3)))))
  // }
}
