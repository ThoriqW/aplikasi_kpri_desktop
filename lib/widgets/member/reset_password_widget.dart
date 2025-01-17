import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPasswordWidget extends ConsumerStatefulWidget {
  const ResetPasswordWidget({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ResetPasswordWidget> createState() =>
      _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends ConsumerState<ResetPasswordWidget> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        _resetPasswordMember(widget.id);
      },
      icon: const Icon(
        Icons.reset_tv,
        color: Colors.redAccent,
      ),
      label: Text(
        _isLoading ? "Loading..." : 'Reset Password',
      ),
    );
  }

  Future<void> _resetPasswordMember(String id) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final resetPasswordMember = await ref.watch(
        resetPasswordMemberProvider(id).future,
      );
      if (!mounted) return;
      if (resetPasswordMember is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: resetPasswordMember.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) {
          ref.watch(memberModeNotifierProvider.notifier).switchToView();
        });
      } else if (resetPasswordMember is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: resetPasswordMember.errors,
              alertTitle: "Gagal",
            );
          },
        );
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomAlertDialog(
            alertDesc: "Gagal terhubung ke server!!",
            alertTitle: "Gagal",
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
