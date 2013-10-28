package net.kaleidos.directmessagesample
import net.kaleidos.directmessages.DirectMessageService


class UserController {
    def directMessageService // instanciate the service

    def index() {
        def user = User.findByName('Paul')
        def messages = directMessageService.getLastMessages(user.id)
        render view:'messagesList', model:[user:user, messages:messages]
    }
}
