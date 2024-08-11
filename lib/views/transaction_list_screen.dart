import 'package:flutter/material.dart';

void main() {
  runApp(OrderApp());
}

class OrderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransactionsPage(),
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
    );
  }
}

//Halaman Transaksi
class TransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Transactions',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {
              // Logic untuk filter
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Jumlah transaksi
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(Icons.water_drop, color: Colors.red, size: 30.0),
                      title: Text(
                        'PT. RIUNG MITRA LESTARI - REBI\nB24133566 (CRITICAL)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Unit No: DT3228 - Model: FMX400\nComponent: ENGINE',
                      ),
                      trailing: Text('Report: Jul 25, 2024'),
                      onTap: () {
                        // Aksi ketika transaksi diklik
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Halaman Detail Transaksi


class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '17.14',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('B24133566'),
              SizedBox(height: 16),
              Text('Customer Name: PT. RIUNG MITRA LESTARI - REBH'),
              Text('Unit Location: MLW'),
              Text('Unit Model: FMX400'),
              Text('Serial Number: A837609'),
              Text('Unit Number: DT3228'),
              Text('Component: ENGINE'),
              Text('Component: VFMX400E'),
              Text('Matrix: GULF 15W40'),
              SizedBox(height: 16),
              Text('Recommendations', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Viskositas dibawah standard dan oksidasi cukup tinggi, terdeteksi FAME dilution, indikasi abnormal temperature. Pelumas belum diganti.'),
              Text('Hindari overheat / overload. Resampling 250 jam berikutnya.'),
            ],
          ),
        ),
      ),
    );
  }
}
