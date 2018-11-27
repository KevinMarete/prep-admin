<?php

namespace App\Http\Controllers;

use App\assessmentUser;
use App\assessmentMessage;
use Illuminate\Http\Request;
use App\Events\MessageSent;

class ChatsController extends Controller
{
    //
    public function __construct()
    {
        //$this->middleware('auth');
    }

    public function getUserDetails($user_id){
        //Get user
        $user = assessmentUser::find($user_id);
        return $user;
    }   


    public function index(){
        $data['user'] = $this->getUserDetails(114);
        return view('chat/chat', $data);
    }

        /**
     * Fetch all messages
     *
     * @return Message
     */
    public function fetchMessages()
    {
    return assessmentMessage::with('assessmentUser')->get();
    }

    /**
     * Persist message to database
     *
     * @param  Request $request
     * @return Response
     */
    public function sendMessage(Request $request)
    {
    
    //Get user details
    $user =  $this->getUserDetails(114);
    $user_id = $user->id;

    //Save message to DB
    $message = assessmentMessage::create([
        'message_text' => $request->input('message_text'),
        'messenger_id' => $user_id
    ]);

    broadcast(new MessageSent($user, $message))->toOthers();

    return ['status' => 'Message Sent!'];
    }
}
