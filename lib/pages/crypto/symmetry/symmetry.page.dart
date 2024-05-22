import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_startup/pages/crypto/crypto.page.dart';
import 'package:flutter_startup/theme/dimensions.dart';

/// 对称加密
class SymmetryPage extends CryptoPage {
  String secretKey = "";
  int type = 0; // 0: aes, 1: des

  SymmetryPage({super.key}) : super(title: "对称加密/解密");

  @override
  String encode(String? input) {
    // AES/DES
    log('key:$secretKey');
    if (secretKey.isEmpty) return "";
    return type == 0
        ? crypto.aes(input, secretKey, true)
        : crypto.des(input, secretKey, true);
  }

  @override
  String decode(String? input) {
    if (secretKey.isEmpty) return "";
    return crypto.aes(input, secretKey, false);
  }

  @override
  State<StatefulWidget> createState() => SymmetryState();
}

class SymmetryState extends CryptoState<SymmetryPage> {
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
          label: const Text("AES"),
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
          label: const Text("DES"),
          selected: _index == 1,
        ),
        const SizedBox(width: DefaultPaddingValue),
      ],
    );
  }

  @override
  Widget? buildExtension() {
    return TextField(
      onChanged: ((value) {
        widget.secretKey = value;
        if (value.isEmpty ||
            value.length == 16 ||
            value.length == 24 ||
            value.length == 32) {
          setState(() => _errorKey = null);
        } else {
          setState(() => _errorKey = "Key length should be 16/24/32");
        }
      }),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: '秘钥',
        alignLabelWithHint: true,
        errorText: _errorKey,
      ),
    );
  }
}
