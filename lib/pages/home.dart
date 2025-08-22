import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noobtopro/models/category.dart';
import 'package:noobtopro/models/doctor.dart';
import 'package:noobtopro/pages/detail.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<CategoryModel> categoriesData = CategoryModel.getCategories();
  final List<DoctorModel> doctorsData = DoctorModel.getDoctors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          categories(),
          Expanded(child: doctors()),
        ],
      ),
    );
  }

  Column categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
          child: Text(
            "Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 50,
          margin: const EdgeInsets.all(16.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  for (var item in categoriesData) {
                    item.isSelected = false;
                  }
                  categoriesData[index].isSelected = true;
                  setState(() {});
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: categoriesData[index].isSelected
                            ? const Color.fromRGBO(81, 168, 255, 0.45)
                            : const Color.fromRGBO(5, 6, 24, 0.05),
                        offset: const Offset(0, 4),
                        blurRadius: 25,
                      ),
                    ],
                    color: categoriesData[index].isSelected
                        ? const Color(0xff51A8FF)
                        : Colors.white,
                  ),
                  child: SvgPicture.asset(
                    categoriesData[index].vector,
                    fit: BoxFit.none,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 55),
            itemCount: categoriesData.length,
          ),
        ),
      ],
    );
  }

  Container header() {
    return Container(
      color: Color(0xff51A8FF),
      width: double.infinity,
      height: 350,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'HI EDi',
                style: TextStyle(fontSize: 18, color: Color(0xffFFFFFF)),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 0.04),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  'assets/vectors/notification.svg',
                  fit: BoxFit.none,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            "Let's find \nyour top doctor",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              // tùy chỉnh giao diện TextField
              filled: true, // cho phép tô màu nền
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ), // prefixIcon thêm một icon phía trước bên trái ô nhập dữ liệu
              hintText: 'Search here...', // hiển thị gợi ý văn bản
              hintStyle: TextStyle(fontWeight: FontWeight.w300),
              border: OutlineInputBorder(
                // OutlineInputBorder  để tạo đường viền cho TextField
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget doctors() {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailPage(doctorModel: doctorsData[index]),
              ),
            );
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,

              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(5, 6, 24, 0.05),
                  offset: const Offset(0, 4),
                  blurRadius: 25,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: doctorsData[index].imageBox,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage(doctorsData[index].image),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorsData[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        doctorsData[index].specialties.first,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            doctorsData[index].score.toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: doctorsData.length,
    );
  }
}
