package example.scenarios

import io.cucumber.scala.ScalaDsl
import org.scalatest.matchers.should.Matchers
import io.cucumber.scala.EN
import a01b.sol2.LogicImpl
import a01b.sol2.Logic
import scala.util.Random
import a01b.sol2.Position
import java.util.Optional

class oopGUISteps extends ScalaDsl with EN with Matchers:

  var logics: Option[Logic] = None
  var gridSize: Int = 0
  var selectedCells: List[Position] = List()
  var cellOffset: Int = 0
  var direction: Int = -1

  private def getPosition(gridSize: Int) =
    Position(Random.nextInt(gridSize), Random.nextInt(gridSize))

  private def clickCells(times: Int) =
    LazyList
      .from(0)
      .map(_ => getPosition(gridSize))
      .filter(!selectedCells.contains(_))
      .filter(!isOnTheBorder(_))
      .takeWhile(_ => selectedCells.size < times)
      .foreach(c => selectedCells = selectedCells :+ c)
    selectedCells.foreach(logics.get.hit(_))

  private def isOnTheBorder(position: Position) =
    position.x == 0 || position.x == gridSize - 1

  private def leftBorderReached(logics: Logic) = anyNumberInColumn(logics, 0)

  private def rightBorderReached(logics: Logic) =
    anyNumberInColumn(logics, gridSize - 1)

  private def anyNumberInColumn(logics: Logic, column: Int) =
    !(0 until gridSize)
      .map(Position(column, _))
      .forall(logics.getMark(_).isEmpty())

  Given("""a square grid of size {int}""") { (size: Int) =>
    gridSize = size
    logics = Some(LogicImpl(gridSize))
    selectedCells = List()
  }

  When("""the user clicks on {int} cells""") { (clicks: Int) =>
    clickCells(clicks)
  }

  When("""the user clicks on the first {int} cells""") { (clicks: Int) =>
    clickCells(clicks)
  }

  Then("""the cells are numbered from {int} to {int}""") {
    (start: Int, end: Int) =>
      for (i <- start to end) {
        logics.get.getMark(selectedCells(i - 1)) should be(Optional.of(i))
      }
  }

  Given("""the user has clicked on {int} cells""") { (times: Int) =>
    clickCells(times)
  }

  Given("""none of the numbered cells are at the left border""") { () =>
    println(selectedCells)
    leftBorderReached(logics.get) should be(false)
  }

  When("""the user clicks on any other cell""") { () =>
    logics.get.hit(getPosition(gridSize))
    cellOffset += direction
  }

  Then("""the numbered cells are moved to the left by one position""") { () =>
    checkIfNumberedCellsHaveMovedToTheLeftBy(1)
  }

  Given(
    """the user has clicked on any of the cell until the farmost-left numbered cell has reached the left border"""
  ) { () =>
    while (!leftBorderReached(logics.get)) {
      logics.get.hit(getPosition(gridSize))
      cellOffset += direction
    }
    direction *= -1
  }

  Given("""none of the numbered cells are at the right border""") { () =>
    rightBorderReached(logics.get) should be(false)
  }

  Then("""the numbered cells are moved to the right by one position""") { () =>
    checkIfNumberedCellsHaveMovedToTheRightBy(1)
  }

  Given(
    """the user has clicked on any of the cell until the farmost-right numbered cell has reached the right border"""
  ) { () =>
    while (!rightBorderReached(logics.get)) {
      logics.get.hit(getPosition(gridSize))
    }
  }

  Then("""the game ends""") { () =>
    logics.get.isOver() should be(true)
  }

  private def checkIfNumberedCellsHaveMovedToTheLeftBy(numOfPositions: Int) =
    checkIfNumberedCellsHaveMovedByOffset(-numOfPositions)

  private def checkIfNumberedCellsHaveMovedToTheRightBy(numOfPositions: Int) =
    checkIfNumberedCellsHaveMovedByOffset(numOfPositions)

  private def checkIfNumberedCellsHaveMovedByOffset(offset: Int) =
    selectedCells
      .map(p => Position(p.x + cellOffset, p.y))
      .foreach(p => {
        logics.get.getMark(p) shouldNot be(Optional.empty())
      })
