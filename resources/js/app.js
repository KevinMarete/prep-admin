
require('./bootstrap');

window.Vue = require('vue');

//Vue.component('chat-messages', require('./components/ChatMessages.vue'));
//Vue.component('chat-form', require('./components/ChatForm.vue'));

const app = new Vue({
    el: '#chatapp',

    data: {
        messages: []
    },

    created() {
        this.fetchMessages();
            Echo.channel('chat')
            .listen('MessageSent', (e) => {
            this.messages.push({
                message_text: e.message.message_text,
                user: e.messenger_id
            });
        });
    },

    methods: {
        fetchMessages() {
            axios.get('/messages').then(response => {
                this.messages = response.data;
            });
        },

        addMessage(message) {
            this.messages.push(message);
            console.log(message);
            axios.post('/messages', message).then(response => {
              console.log(response.data);
            });
        }
    }
});
