<template>
    <ul class="chat">
        <li class="left clearfix" v-for="message in messages"  :key="message.id">
            <div class="chat-body clearfix">
                <div class="header">
                    <strong class="primary-font">
                        {{ message.messenger_id }}
                    </strong>
                </div>
                <p>
                    {{ message.message_text }}
                </p>
            </div>
        </li>
    </ul>    
</template>

<script>
    export default{
        props: ['messages']
    }
</script>