package tf.bug.ledo

import cats.effect._
import cats.syntax.all._
import com.monovore.decline.Opts
import com.monovore.decline.effect.CommandIOApp
import org.dhallj.syntax._
import org.dhallj.imports.syntax._
import org.http4s.client.Client
import org.http4s.jdkhttpclient.JdkHttpClient

import java.nio.file.Path

object Main extends CommandIOApp(
  name = "ledo",
  header = "Dhall Build/Environment Tool",
  version = "0.1.0"
) {

  override def main: Opts[IO[ExitCode]] = {
    val config: Opts[Path] = Opts.argument[Path]("cfg.dhall")

    config.map { path =>
      val http: Resource[IO, Client[IO]] =
        JdkHttpClient.simple[IO]

      http.use { implicit client: Client[IO] =>
        val parsePath = path.toString.parseExpr
        parsePath.traverse(_.resolveImports[IO]).flatMap { resolvePath =>
          val normalizeDhall = resolvePath.map(_.normalize)
          val typeCheckDhall = normalizeDhall.flatMap(_.typeCheck)
          IO.println(normalizeDhall) *> IO.println(typeCheckDhall)
        }.as(ExitCode.Success)
      }
    }
  }

}
