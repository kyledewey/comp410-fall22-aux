sealed trait UnificationNode
case class Variable(name: String) extends UnificationNode
case class Number(value: Int) extends UnificationNode
case class Structure(name: String, terms: Seq[UnificationNode]) extends UnificationNode

class UnificationEnvironment(val mapping: Map[Variable, UnificationNode]) {
  // def setrep(node: UnificationNode): UnificationNode = {
  //   // if isinstance(node, Number):
  //   //   return node
  //   node match {
  //     case Number(_) => return node
  //       // if (node instanceof Variable) {
  //       //   Variable v = (Variable)node;
  //       //   if (mapping.contains(v)) {
  //     case v@Variable(_) => {
  //       if (mapping.contains(v)) {
  //         return setrep(mapping(v))
  //       } else {
  //         return v
  //       }
  //     }
  //   }
  // }

  def setrep(node: UnificationNode): UnificationNode = {
    node match {
      case v@Variable(_) => mapping.get(v).map(setrep _).getOrElse(node)
      case _ => node
    }
  }

  def addEdge(
    variable: Variable,
    other: UnificationNode): Some[UnificationEnvironment] = {
    if (variable == other) {
      Some(this)
    } else {
      Some(new UnificationEnvionment(mapping + (v -> other)))
    }
  }

  def unify(
    node1: UnificationNode,
    node2: UnificationNode): Option[UnificationEnvironment] = {
    (setrep(node1), setrep(node2)) match {
      case (Number(value1), Number(value2)) if value1 == value2 => Some(this)
      case (Structure(name1, terms1), Structure(name2, terms2))
          if name1 == name2 && terms1.size == terms2.size => {
            terms1.zip(terms2).foldLeft(Some(this): Option[UnificationEnvironment])(
              (accum, cur) =>
                accum.flatMap(_.unify(cur._1, cur._2)))
          }
      case (v@Variable(_), other) => addEdge(v, other)
      case (other, v@Variable(_)) => addEdge(v, other)
      case _ => None
    }
  }
}
