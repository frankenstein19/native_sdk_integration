package com.example.native_view_example

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel;



object LoginEventHandler : EventChannel.StreamHandler {
    private var eventChannel: EventChannel? = null
    private var eventSink: EventChannel.EventSink? = null
    private  var  messenger: BinaryMessenger? = null
    fun register(messenger: BinaryMessenger){
        this.messenger=messenger
        eventChannel = EventChannel(this.messenger, "email_password_event_channel")
        eventChannel?.setStreamHandler(this)
    }

   fun  sendDataToNative(email:String?,password:String?){
       eventSink?.success(mapOf("email" to email, "password" to password))
   }



    fun getMessenger(): BinaryMessenger? {
        return messenger
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
       eventSink =events
    }

    override fun onCancel(arguments: Any?) {
        eventSink =null
    }
}