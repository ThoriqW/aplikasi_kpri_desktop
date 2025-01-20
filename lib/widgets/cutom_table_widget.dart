import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:flutter/material.dart';

class CustomDataTable<T> extends StatefulWidget {
  final T fixedCornerCell;
  final List<T> fixedColCells;
  final List<T> fixedRowCells;
  final List<List<dynamic>> rowsCells;
  final Widget Function(dynamic data) cellBuilder;
  final Widget Function(dynamic data) headerBuilder;
  final double fixedColWidth;
  final double cellWidth;
  final double cellWidthWidget;
  final double cellHeightWidget;
  final double cellHeight;
  final double cellMargin;
  final double cellSpacing;

  const CustomDataTable({
    super.key,
    required this.fixedCornerCell,
    required this.fixedColCells,
    required this.fixedRowCells,
    required this.rowsCells,
    required this.cellBuilder,
    required this.headerBuilder,
    this.fixedColWidth = 150.0,
    this.cellHeight = 56.0,
    this.cellWidth = 150.0,
    this.cellMargin = 10.0,
    this.cellSpacing = 10.0,
    this.cellWidthWidget = 150.0,
    this.cellHeightWidget = 56.0,
  });

  @override
  State<StatefulWidget> createState() => CustomDataTableState();
}

class CustomDataTableState<T> extends State<CustomDataTable<T>> {
  final _columnController = ScrollController();
  final _rowController = ScrollController();
  final _subTableYController = ScrollController();
  final _subTableXController = ScrollController();

  Widget _buildChild(double width, dynamic data) =>
      SizedBox(width: width, child: widget.cellBuilder.call(data));

  Widget _buildHeader(double width, dynamic data) =>
      SizedBox(width: width, child: widget.headerBuilder.call(data));

  Widget _buildFixedCol() => Material(
        color: GlobalColors.white,
        child: DataTable(
            horizontalMargin: widget.cellMargin,
            columnSpacing: widget.cellSpacing,
            headingRowHeight: widget.cellHeightWidget == 56.0
                ? widget.cellHeight
                : widget.cellHeightWidget,
            columns: [
              DataColumn(
                  label: _buildChild(
                      widget.fixedColWidth, widget.fixedColCells.first))
            ],
            rows: widget.fixedColCells
                .sublist(widget.fixedRowCells.isEmpty ? 1 : 0)
                .map(
              (c) {
                return DataRow(
                  cells: [
                    DataCell(
                      _buildChild(widget.fixedColWidth, c),
                    )
                  ],
                );
              },
            ).toList()),
      );

  Widget _buildFixedRow() => Material(
        color: GlobalColors.headerTable,
        child: DataTable(
          horizontalMargin: widget.cellMargin,
          columnSpacing: widget.cellSpacing,
          headingRowHeight: widget.cellHeightWidget == 56.0
              ? widget.cellHeight
              : widget.cellHeightWidget,
          columns: widget.fixedRowCells.map((c) {
            if (c == 'STATUS' || c == 'AKSI' || c is Widget) {
              return DataColumn(
                label: _buildHeader(
                  widget.cellWidthWidget == 150
                      ? widget.cellWidth
                      : widget.cellWidthWidget,
                  c,
                ),
              );
            }
            return DataColumn(
              label: _buildHeader(
                widget.cellWidth,
                c,
              ),
            );
          }).toList(),
          rows: const [],
        ),
      );

  Widget _buildSubTable() => Material(
      color: GlobalColors.white,
      child: DataTable(
          horizontalMargin: widget.cellMargin,
          columnSpacing: widget.cellSpacing,
          headingRowHeight: widget.cellHeightWidget == 56.0
              ? widget.cellHeight
              : widget.cellHeightWidget,
          columns: widget.rowsCells.first.map((c) {
            if (c is Widget) {
              return DataColumn(
                label: _buildHeader(
                    widget.cellWidthWidget == 150
                        ? widget.cellWidth
                        : widget.cellWidthWidget,
                    c),
              );
            }
            return DataColumn(
              label: _buildHeader(widget.cellWidth, c),
            );
          }).toList(),
          rows: widget.rowsCells
              .sublist(widget.fixedRowCells.isEmpty ? 1 : 0)
              .map(
                (row) => DataRow(
                  cells: row.map((c) {
                    if (c is Widget) {
                      return DataCell(
                        _buildChild(
                            widget.cellWidthWidget == 150
                                ? widget.cellWidth
                                : widget.cellWidthWidget,
                            c),
                      );
                    }
                    return DataCell(
                      _buildChild(widget.cellWidth, c),
                    );
                  }).toList(),
                ),
              )
              .toList()));

  Widget _buildCornerCell() =>
      widget.fixedColCells.isEmpty || widget.fixedRowCells.isEmpty
          ? const SizedBox.shrink()
          : Material(
              color: GlobalColors.headerTable,
              child: DataTable(
                horizontalMargin: widget.cellMargin,
                columnSpacing: widget.cellSpacing,
                headingRowHeight: widget.cellHeightWidget == 56.0
                    ? widget.cellHeight
                    : widget.cellHeightWidget,
                columns: [
                  DataColumn(
                    label: _buildHeader(
                      widget.fixedColWidth,
                      widget.fixedCornerCell,
                    ),
                  )
                ],
                rows: const [],
              ),
            );

  @override
  void initState() {
    super.initState();
    _subTableXController.addListener(() {
      _rowController.jumpTo(_subTableXController.position.pixels);
    });
    _subTableYController.addListener(() {
      _columnController.jumpTo(_subTableYController.position.pixels);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            SingleChildScrollView(
              controller: _columnController,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              child: _buildFixedCol(),
            ),
            Flexible(
              child: Scrollbar(
                controller: _subTableXController,
                child: SingleChildScrollView(
                  controller: _subTableXController,
                  scrollDirection: Axis.horizontal,
                  child: Scrollbar(
                    controller: _subTableYController,
                    child: SingleChildScrollView(
                      controller: _subTableYController,
                      scrollDirection: Axis.vertical,
                      child: _buildSubTable(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            _buildCornerCell(),
            Flexible(
              child: SingleChildScrollView(
                controller: _rowController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: _buildFixedRow(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
