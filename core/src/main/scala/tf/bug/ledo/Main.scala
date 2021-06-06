package tf.bug.ledo

import cats.effect.{ExitCode, IO}
import com.monovore.decline.Opts
import com.monovore.decline.effect.CommandIOApp
import org.dhallj.syntax._

import java.nio.file.Path

object Main extends CommandIOApp(
  name = "ledo",
  header = "Dhall Build/Environment Tool",
  version = "0.1.0"
) {

  override def main: Opts[IO[ExitCode]] = {
    val config: Opts[Path] = Opts.argument[Path]("cfg.dhall")

    config.map { path =>
      val parsePath = path.toString.parseExpr
      val resolvePath = parsePath.flatMap(_.resolve)
      val normalizeDhall = resolvePath.map(_.normalize)
      val typeCheckDhall = normalizeDhall.flatMap(_.typeCheck)
      IO.println(normalizeDhall).productR(IO.println(typeCheckDhall)).as(ExitCode.Success)
    }
  }

}
