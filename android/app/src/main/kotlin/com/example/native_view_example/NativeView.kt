package com.example.native_view_example

import android.content.Context
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView


internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private var emailTextView: EditText? = null
    private var passwordTextView: EditText? = null
    private var loginButton: Button? = null
    private  var layout:LinearLayout?=null
    init {
         layout = LinearLayout(context)
        layout?.orientation = LinearLayout.VERTICAL
        emailTextView = EditText(context)
        passwordTextView = EditText(context)
        loginButton = Button(context)
        emailTextView?.hint = "Email"
        emailTextView?.textSize =16f
        passwordTextView?.hint ="Password"
        passwordTextView?.textSize =16f
        loginButton?.text ="Login"
        loginButton?.textSize =16f
        layout?.addView(emailTextView)
        layout?.addView(passwordTextView)
        layout?.addView(loginButton)

    }

    override fun getView(): View? {
        return layout
    }

    override fun dispose() {
        // Clean up resources if needed
    }

}