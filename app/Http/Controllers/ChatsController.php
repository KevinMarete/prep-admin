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

    public function index(){
        return view('chat/chat');
    }

        /**
     * Fetch all messages
     *
     * @return Message
     */
    public function fetchMessages()
    {
    return Message::with('assessmentUser')->get();
    }

    /**
     * Persist message to database
     *
     * @param  Request $request
     * @return Response
     */
    public function sendMessage(Request $request)
    {
    //Get user
    $user_id = Request::segment(3);
    $user = assessmentUser::find($user_id);

    $message = $user->messages()->create([
        'message' => $request->input('message')
    ]);

    broadcast(new MessageSent($user, $message))->toOthers();

    return ['status' => 'Message Sent!'];
    }
}
