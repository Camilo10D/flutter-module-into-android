package com.example.androidapp

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import com.example.androidapp.ui.theme.AndroidAppTheme
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class MainActivity : ComponentActivity() {

    private lateinit var flutterEngine : FlutterEngine
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Instantiate a FlutterEngine.
        flutterEngine = FlutterEngine(this)

        // Configure an initial route. (main by default, so it's optional in this case)
        flutterEngine.navigationChannel.setInitialRoute("/info");

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache
            .getInstance()
            .put("my_engine_id", flutterEngine)


        setContent {
            AndroidAppTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    Column(modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.Center,
                        horizontalAlignment = Alignment.CenterHorizontally,
                    ) {
                        Button(onClick = { goToFlutterModule() }) {
                            Text("Ejecutar módulo de Flutter")
                        }
                    }
                }
            }
        }
    }

    private fun goToFlutterModule(){
        /*startActivity(
            FlutterActivity.createDefaultIntent(this)
        )*/

        ///If we have a pre-warmed engine, we must use the cachedEngine
        startActivity(
            FlutterActivity
                .withCachedEngine("my_engine_id")
                .build(this)
        )
    }
}

