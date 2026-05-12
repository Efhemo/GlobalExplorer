import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.onChanged,
    required this.onClear,
    this.hintText = 'Search countries…',
  });

  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final String hintText;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clear() {
    _controller.clear();
    widget.onClear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: ListenableBuilder(
            listenable: _controller,
            builder: (_, _) => _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: _clear,
                    tooltip: 'Clear',
                  )
                : const SizedBox.shrink(),
          ),
          filled: true,
          fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
            alpha: 0.6,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
