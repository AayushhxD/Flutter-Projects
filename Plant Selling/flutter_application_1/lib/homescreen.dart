import "package:flutter/material.dart";
import "package:flutter_application_1/detailscreen.dart";

class homescreen extends StatefulWidget {
  const homescreen({super.key});
  @override
  State createState() => _homeScreenState();
}

class _homeScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 159,
              width: 360,
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 81,
                        width: 250,
                        child: Image.asset(
                          "assets/images/7.png",
                          width: 200,
                          height: 81,
                          alignment: Alignment.topRight,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 64,
                        width: 176,
                        child: Text(
                          "Find Your Favorite Plants",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.local_mall_outlined,
                                color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    height: 100,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(204, 231, 185, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "30 % OFF",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "02 - 23- April",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Image.asset(
                            "assets/images/5.png",
                            // height:108,
                            // width: 120,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromRGBO(62, 102, 24, 1)),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 109, 151, 70)),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 117, 153, 84)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Indoor",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      height: 188,
                      width: 141,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              "assets/images/3.png",
                              height: 112,
                              width: 90,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Snake Plants",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "₹300",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(62, 102, 24, 1),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(237, 238, 235, 1),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Icon(
                                    size: 17,
                                    color: Colors.black,
                                    Icons.local_mall_outlined,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(
              thickness: 1,
              indent: 10,
              endIndent: 10,
              color: Color.fromRGBO(204, 211, 196, 1),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Outdoor",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      height: 188,
                      width: 141,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              "assets/images/3.png",
                              height: 112,
                              width: 90,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Snake Plants",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "₹300",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(62, 102, 24, 1),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(237, 238, 235, 1),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Icon(
                                  size: 17,
                                  color: Colors.black,
                                  Icons.local_mall_outlined,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
