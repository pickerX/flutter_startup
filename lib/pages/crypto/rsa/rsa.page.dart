import 'package:flutter/material.dart';
import 'package:flutter_startup/pages/crypto/crypto.page.dart';
import 'package:flutter_startup/theme/dimensions.dart';

/// RSA 公钥加密， 私钥解密
/// todo RSA2 实现
class RSAPage extends CryptoPage {
  String privateKey = "";
  String publicKey = "";
  int type = 0;

  RSAPage({super.key}) : super(title: "RSA");

  @override
  String encode(String? input) {
    if (publicKey.isEmpty) return "";
    return type == 0
        ? crypto.rsa(input, privateKey, publicKey, true)
        : crypto.rsa(input, privateKey, publicKey, true);
  }

  @override
  String decode(String? input) {
    if (privateKey.isEmpty) return "";
    return type == 0
        ? crypto.rsa(input, privateKey, publicKey, false)
        : crypto.rsa(input, privateKey, publicKey, false);
  }

  /// RSA 加解密耗时长，避免自动造成卡顿
  @override
  bool auto() => false;

  @override
  State<StatefulWidget> createState() => RSAState();
}

class RSAState extends CryptoState<RSAPage> {
  int _index = 0;
  String? _errorKey;

  @override
  Widget? buildHeaderExtension() {
    return Row(
      children: [
        ChoiceChip(
          onSelected: (value) {
            setState(() {
              _index = 0;
              widget.type = _index;
            });
          },
          label: const Text("RSA"),
          selected: _index == 0,
        ),
        const SizedBox(width: DefaultPaddingValue),
        ChoiceChip(
          onSelected: (value) {
            setState(() {
              _index = 1;
              widget.type = _index;
            });
          },
          label: const Text("RSA2"),
          selected: _index == 1,
        ),
        const SizedBox(width: DefaultPaddingValue),
      ],
    );
  }

  @override
  Widget? buildExtension() {
    return Column(
      children: [
        TextField(
          minLines: 3,
          maxLines: 20,
          onChanged: ((value) {
            widget.publicKey = value;
          }),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: '公钥',
            alignLabelWithHint: true,
            errorText: _errorKey,
          ),
        ),
        const SizedBox(height: DefaultPaddingValue),
        TextField(
          minLines: 3,
          maxLines: 20,
          onChanged: ((value) {
            widget.privateKey = value;
          }),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: '私钥',
            alignLabelWithHint: true,
            errorText: _errorKey,
          ),
        ),
      ],
    );
  }
}
