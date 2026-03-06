import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "User Management",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2D3E),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "All Users",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text("Add New"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    horizontalMargin: 0,
                    columnSpacing: 16,
                    columns: const [
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("Role")),
                      DataColumn(label: Text("Status")),
                      DataColumn(label: Text("Date")),
                    ],
                    rows: List.generate(
                      10,
                      (index) => DataRow(
                        cells: [
                          DataCell(Row(
                            children: [
                              const Icon(Icons.account_circle, color: Colors.white54),
                              const SizedBox(width: 10),
                              Text("User Name $index"),
                            ],
                          )),
                          const DataCell(Text("Admin")),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: index % 2 == 0 ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                index % 2 == 0 ? "Active" : "Inactive",
                                style: TextStyle(
                                  color: index % 2 == 0 ? Colors.green : Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          const DataCell(Text("2023-10-25")),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
