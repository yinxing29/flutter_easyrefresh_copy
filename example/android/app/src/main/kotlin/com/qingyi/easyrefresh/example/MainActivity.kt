import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "samples.flutter.dev/battery";

  // 伴生对象
  companion object {
    // 交互通道名字
    val CHANNEL = "com.qingyi.easyrefresh.example/channel"
    // 支付宝捐赠
    val ALIPAY_DONATION = "aliPayDonation"
  }

  if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
    //API>21,设置状态栏颜色透明
    window.statusBarColor = 0
  }

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
    .setMethodCallHandler(
    (call, result) -> {
    // 判断交互方法
    when (methodCall.method) {
      ALIPAY_DONATION -> AlipayZeroSdk.startAlipayClient(this, "FKX03889Z997BS1BNALOC9")
    }
    }
    );
  }
}
