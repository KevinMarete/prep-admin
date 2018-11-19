@include('partials/general/meta')
@include('styles/chat-styles');
<div class ="columns is-mobile" id="chatapp">
    <div class = "column is-3 is-offset-9">
        <div class = "box">
            <div class = "panel"> 
                <p class ="panel-heading">Chat</p>
                <div class = "panel-block">
                    <chat-messages :messages="messages"></chat-messages>     
                </div>
                <div class ="panel-block">
                    <chat-form v-on:messagesent="addMessage" :user="" ></chat-form>
                </div>
            </div>  
            <chat-messages :messages="messages"></chat-messages>
        </div>
    </div>
</div>
@include('partials/general/scripts')
