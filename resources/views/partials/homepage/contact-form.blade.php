<div class = "container">
  {!! Form::open(['route' => 'email']) !!}
    <div class="field">
      <label class="label has-text-justified">Email</label>
      <div class="control">
        <input class="input" type="email" name="email" placeholder="Email" value="">
      </div>
    </div>

    <div class="field">
      <label class="label has-text-justified ">Subject</label>
      <div class="control">
        <input class="input"  name="subject" placeholder="Subject" type="text">
      </div>
    </div>

    <div class="field">
      <label class="label has-text-justified ">Message</label>
      <div class="control">
        <textarea class="textarea"  name="message" placeholder="Message"></textarea>
      </div>
    </div>

    <div class="field is-grouped">
      <div class="control">
        <button type="submit" class="button is-link">Submit</button>
      </div>
    </div>
  {!! Form::close() !!}
</div>