package com.surcharge.plugins

import io.ktor.http.*
import io.ktor.resources.*
import io.ktor.serialization.kotlinx.json.json
import io.ktor.server.application.*
import io.ktor.server.http.content.staticFiles
import io.ktor.server.plugins.contentnegotiation.ContentNegotiation
import io.ktor.server.plugins.statuspages.*
import io.ktor.server.request.receiveText
import io.ktor.server.request.uri
import io.ktor.server.resources.*
import io.ktor.server.resources.Resources
import io.ktor.server.response.*
import io.ktor.server.routing.*
import kotlinx.serialization.Serializable
import java.io.File

fun Application.configureRouting() {
    install(StatusPages) {
        exception<Throwable> { call, cause ->
            call.respondText(text = "500: $cause" , status = HttpStatusCode.InternalServerError)
        }
    }
    install(Resources)
    install(ContentNegotiation) { json() }
    routing {
        get("/") {
            call.respondText("Hello World!")
        }
        get("/square") {
            call.respondText(call.request.uri)
        }
        staticFiles("/.well-known", File("static"))
        get<Bundles> { bundle ->

            call.respond(bundle)
        }
    }
}

@Serializable
@Resource("/bundles")
class Bundles(val sort: String? = "new") {
    @Resource("new")
    class New(val parent: Bundles = Bundles())

    @Resource("{name}")
    class Name(val parent: Bundles = Bundles(), val name: String) {
        @Resource("edit")
        class Edit(val parent: Name)
    }
}

@Serializable
@Resource("/prints")
class Prints(val sort: String? = "new") {
    @Resource("new")
    class New(val parent: Prints = Prints())

    @Resource("{name}")
    class Name(val parent: Prints = Prints(), val name: String) {
        @Resource("edit")
        class Edit(val parent: Name)
    }
}
