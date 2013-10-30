package net.kaleidos.directmessagessample
import net.kaleidos.directmessages.DirectMessageService


class UserController {
    def directMessageService // instanciate the service
    def currentUser = User.findByName('Paul') //Fake 'logged' user

    def index() {
        def messages = directMessageService.getLastMessages(currentUser.id)
        render view:'messagesList', model:[user:currentUser, messages:messages]
    }

    def conversation(){
        long id = Long.parseLong(params.id)
        def messages = directMessageService.getMessages(currentUser.id, id)
        def otherUser = User.get(id)
        render view:'conversation', model:[user:currentUser, otherUser:otherUser, messages:messages]
    }

    def sendMessage() {
        long id = Long.parseLong(params.id)
        if (params.text) {
            directMessageService.sendMessage(currentUser.id, id, params.text)
        }
        redirect mapping:"conversation", params:params
    }
}
