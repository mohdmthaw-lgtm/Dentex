import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';
import '../../models/account_request.dart';
import '../../services/firebase/service_providers.dart';

/// Reachable from [LoginScreen] without any credentials — this is the
/// in-app "account creation" flow App Review looks for under Guideline 3.2.
/// It never creates a login itself (only `createDoctorAccount` does that);
/// it just files a pending request the distributor's admin reviews and
/// approves from the Account Requests screen.
///
/// Step 0 is always the account-type choice (solo clinic vs. medical
/// center) — the solo path then continues into the exact same single form
/// this screen always had; only the center path grows a step indicator and
/// the extra center-name/chair-count/additional-doctors fields.
class RequestAccountScreen extends ConsumerStatefulWidget {
  const RequestAccountScreen({super.key});

  @override
  ConsumerState<RequestAccountScreen> createState() =>
      _RequestAccountScreenState();
}

class _DoctorEntry {
  _DoctorEntry()
      : nameController = TextEditingController(),
        phoneController = TextEditingController(),
        passwordController = TextEditingController();

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  bool isManager = false;

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }
}

class _RequestAccountScreenState extends ConsumerState<RequestAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _clinicController = TextEditingController();
  final _locationController = TextEditingController();
  final _notesController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _centerNameController = TextEditingController();
  final _chairCountController = TextEditingController(text: '1');
  final List<_DoctorEntry> _doctors = [];

  bool _obscurePassword = true;
  bool _isLoading = false;
  bool _submitted = false;
  String? _errorMessage;

  // 0 = type selection, 1 = the actual form (solo, unchanged; or center).
  int _step = 0;
  String _accountType = AccountRequestType.solo;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _clinicController.dispose();
    _locationController.dispose();
    _notesController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _centerNameController.dispose();
    _chairCountController.dispose();
    for (final d in _doctors) {
      d.dispose();
    }
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      await ref.read(accountRequestRepositoryProvider).submitRequest(
            name: _nameController.text.trim(),
            phone: _phoneController.text.trim(),
            password: _passwordController.text,
            clinicName: _clinicController.text.trim(),
            location: _locationController.text.trim(),
            notes: _notesController.text.trim(),
            accountType: _accountType,
            centerName: _accountType == AccountRequestType.center
                ? _centerNameController.text.trim()
                : '',
            chairCount: _accountType == AccountRequestType.center
                ? int.tryParse(_chairCountController.text) ?? 1
                : 1,
            doctors: _accountType == AccountRequestType.center
                ? _doctors
                    .map((d) => AccountRequestDoctor(
                          name: d.nameController.text.trim(),
                          phone: d.phoneController.text.trim(),
                          password: d.passwordController.text,
                          isManager: d.isManager,
                        ))
                    .toList()
                : const [],
          );
      if (mounted) setState(() => _submitted = true);
    } catch (_) {
      if (mounted) setState(() => _errorMessage = 'حدث خطأ، حاول مرة أخرى');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('طلب حساب جديد')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: _submitted
                  ? _SuccessView(onDone: () => context.go('/login'))
                  : (_step == 0 ? _buildTypeSelector() : _buildForm()),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeSelector() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('ما نوع حسابك؟', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 20),
        _AccountTypeCard(
          title: 'عيادة منفردة',
          subtitle: 'دكتور واحد بعيادته الخاصة',
          icon: Icons.person_outline,
          selected: _accountType == AccountRequestType.solo,
          onTap: () => setState(() => _accountType = AccountRequestType.solo),
        ),
        const SizedBox(height: 12),
        _AccountTypeCard(
          title: 'مركز طبي',
          subtitle: 'أكثر من دكتور وكرسي، بمرضى مشتركين',
          icon: Icons.local_hospital_outlined,
          selected: _accountType == AccountRequestType.center,
          onTap: () => setState(() => _accountType = AccountRequestType.center),
        ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () => setState(() => _step = 1),
          style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
          child: const Text('متابعة'),
        ),
      ],
    );
  }

  Widget _buildForm() {
    final isCenter = _accountType == AccountRequestType.center;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isCenter) ...[
            _StepIndicator(step: 2, totalSteps: 2),
            const SizedBox(height: 16),
          ],
          Text(
            isCenter
                ? 'بيانات مدير المركز، ثم بيانات المركز والدكاترة التابعين له'
                : 'أدخل بياناتك وسيتواصل معك الموزع لتفعيل حسابك',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'الاسم',
              prefixIcon: Icon(Icons.person_outline),
            ),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'مطلوب' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            textDirection: TextDirection.ltr,
            decoration: const InputDecoration(
              labelText: 'رقم الهاتف',
              prefixIcon: Icon(Icons.phone),
            ),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'مطلوب' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            textDirection: TextDirection.ltr,
            decoration: InputDecoration(
              labelText: 'كلمة السر',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
            validator: (v) =>
                (v == null || v.length < 6) ? 'يجب أن تكون 6 أحرف على الأقل' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _obscurePassword,
            textDirection: TextDirection.ltr,
            decoration: const InputDecoration(
              labelText: 'تأكيد كلمة السر',
              prefixIcon: Icon(Icons.lock_outline),
            ),
            validator: (v) =>
                v != _passwordController.text ? 'كلمتا السر غير متطابقتين' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _clinicController,
            decoration: InputDecoration(
              labelText: isCenter ? 'اسم عيادتك داخل المركز' : 'اسم العيادة',
              prefixIcon: const Icon(Icons.local_hospital_outlined),
            ),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'مطلوب' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _locationController,
            decoration: const InputDecoration(
              labelText: 'الموقع (اختياري)',
              prefixIcon: Icon(Icons.location_on_outlined),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _notesController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'ملاحظات (اختياري)',
              prefixIcon: Icon(Icons.notes_outlined),
            ),
          ),
          if (isCenter) ...[
            const Divider(height: 32),
            Text('بيانات المركز', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 12),
            TextFormField(
              controller: _centerNameController,
              decoration: const InputDecoration(
                labelText: 'اسم المركز',
                prefixIcon: Icon(Icons.apartment_outlined),
              ),
              validator: (v) => isCenter && (v == null || v.trim().isEmpty) ? 'مطلوب' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _chairCountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'عدد كراسي الأسنان',
                prefixIcon: Icon(Icons.chair_outlined),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child:
                      Text('الدكاترة التابعون للمركز', style: Theme.of(context).textTheme.titleSmall),
                ),
                TextButton.icon(
                  onPressed: () => setState(() => _doctors.add(_DoctorEntry())),
                  icon: const Icon(Icons.add),
                  label: const Text('إضافة دكتور'),
                ),
              ],
            ),
            for (var i = 0; i < _doctors.length; i++) _buildDoctorRow(i),
          ],
          if (_errorMessage != null) ...[
            const SizedBox(height: 12),
            Text(
              _errorMessage!,
              style: const TextStyle(color: AppTheme.danger),
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _isLoading ? null : () => setState(() => _step = 0),
                  style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                  child: const Text('رجوع'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton(
                  onPressed: _isLoading ? null : _submit,
                  style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('إرسال الطلب'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorRow(int index) {
    final doctor = _doctors[index];
    return Card(
      margin: const EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('دكتور ${index + 1}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600)),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: AppTheme.danger),
                  onPressed: () => setState(() {
                    _doctors[index].dispose();
                    _doctors.removeAt(index);
                  }),
                ),
              ],
            ),
            TextFormField(
              controller: doctor.nameController,
              decoration: const InputDecoration(labelText: 'الاسم'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'مطلوب' : null,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: doctor.phoneController,
              keyboardType: TextInputType.phone,
              textDirection: TextDirection.ltr,
              decoration: const InputDecoration(labelText: 'رقم الهاتف'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'مطلوب' : null,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: doctor.passwordController,
              obscureText: true,
              textDirection: TextDirection.ltr,
              decoration: const InputDecoration(labelText: 'كلمة السر'),
              validator: (v) =>
                  (v == null || v.length < 6) ? 'يجب أن تكون 6 أحرف على الأقل' : null,
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: doctor.isManager,
              title: const Text('مدير المركز'),
              onChanged: (v) => setState(() => doctor.isManager = v ?? false),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountTypeCard extends StatelessWidget {
  const _AccountTypeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: selected ? AppTheme.primary.withOpacity(0.08) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: selected ? AppTheme.primary : Colors.grey.shade200, width: selected ? 2 : 1),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppTheme.primary.withOpacity(0.12),
                child: Icon(icon, color: AppTheme.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    Text(subtitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey.shade600)),
                  ],
                ),
              ),
              if (selected) const Icon(Icons.check_circle, color: AppTheme.primary),
            ],
          ),
        ),
      ),
    );
  }
}

/// Small "step X of Y" indicator shown above the center-account form only —
/// the solo path never shows this, per spec.
class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.step, required this.totalSteps});

  final int step;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (i) {
        final active = i < step;
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(left: i == totalSteps - 1 ? 0 : 4),
            height: 4,
            decoration: BoxDecoration(
              color: active ? AppTheme.primary : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView({required this.onDone});
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle_outline, color: AppTheme.success, size: 64),
        const SizedBox(height: 16),
        Text(
          'تم إرسال طلبك بنجاح',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'سيتواصل معك الموزع قريباً لتفعيل حسابك',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: onDone,
          style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
          child: const Text('العودة لتسجيل الدخول'),
        ),
      ],
    );
  }
}
