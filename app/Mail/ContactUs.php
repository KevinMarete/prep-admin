<?php

namespace App\Mail;
use Illuminate\Http\Request;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class ContactUs extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */

    public $request;


    public function __construct(Request $request)
    {
        //

        $this->request = $request;


    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from($this->request->input('email'))
        ->subject('Contact Us -'. $this->request->input('subject'))
        ->replyTo($this->request->input('email'))
        ->markdown('emails.contactus')
        ->with(['em' => $this->request]);
    }
}
