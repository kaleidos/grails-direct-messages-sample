class UrlMappings {

    static mappings = {

        name index: "/" {controller = 'user'; action = 'index'}
        name conversation: "/conversation" {controller = 'user'; action = 'conversation'}
        name sendMessage: "/sendMessage" {controller = 'user'; action = 'sendMessage'}
        "500"(view:'/error')
    }
}
