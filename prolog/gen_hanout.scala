sealed trait Exp
case object True extends Exp
case object False extends Exp
case class If(e1: Exp, e2: Exp, e3: Exp) extends Exp

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
    (for {
      newDepth <- decBound(depth)
      e1 <- exp(newDepth)
      e2 <- exp(newDepth)
      e3 <- exp(newDepth)
    } yield If(e1, e2, e3))
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
