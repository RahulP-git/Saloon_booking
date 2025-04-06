import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/database.dart';

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState()=>_MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{
  bool one=false;
  bool two=false;
  bool tree=false;
  bool four=false;
  bool five=false;
  bool six=false;
  bool seven=false;
  bool eight=false;
  int track=0;
  List<String>getFormatedDates(){
    final now=DateTime.now();
    final formatter=DateFormat("EEE d");
    return List.generate(10, (index){
      final date=now.add(Duration(days: index));
      return formatter.format(date);
    });
  }
  @override
  Widget build(BuildContext context) {

    final dates=getFormatedDates();

     String? currentDate;
    getBooking()async{
      Map<String, dynamic>userBooking={
        "Date":currentDate,
       "Time":one ? "01:00PM":two? "02:00PM":
        tree ? "03:00PM":four ? "04:00PM":
        five? "05:00PM":six? "06:00PM":
        seven? "07:00PM":"08:00PM"
      };
      await MyDatabase().addUserBooking(userBooking).then((value){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Booked Successfully")));
      });
    }
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Column(
            children: [
              InkWell(
                onTap: (){},
                child: Container(
                   padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                   margin:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  alignment: Alignment.center,
                  //height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:
                  Row(
                    children: [
                      Material(
                        elevation:10,
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQAuQMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAFBgAEAgMHAQj/xABAEAACAQMDAgMGAQgJBAMAAAABAgMABBEFEiExQQYTURQiMmFxgZEHFSNCUqHB8CRTVWJykrHR4TNUgtIWF5T/xAAZAQACAwEAAAAAAAAAAAAAAAACAwABBAX/xAAjEQACAgMAAgIDAQEAAAAAAAAAAQIRAxIhBDEiQRMUUVIy/9oADAMBAAIRAxEAPwAqD7ua8DZ4C1rac7RjvWcZYcmstDbNihuuKyaRgN2K8eXaMVI/0nxdKtRKs8WTfya9cr3NesFQ8CtE0yg7VUsx6KBk0VFWZOY0UsxH41pt4LjVZmt7ErnGWZjgKPXNXdD0ddYlmTUDNAqDhEGGYntzW25ibw5fNbWTqpjAJc+8T9aJKirBrWEmkM9vLnz2ALluhB6Yq+3iS7TSfzeFh8rYYySpyRQrWNYe7m8+8mDS4A4UDAHbigkt9PcApbKX+lWl0q0Xbi7jiXGRn60GnvZLh9kKF2/u1bi0h3UzX821B1UGvDqtta5i023H+MjijSoq7NVvoEsv6a+kWGPqeecVhf6tpGhriwtRPcEcO1aZ5ri8fdcys390cCgeuLhkTgAHPA70SVvoJq1TX9S1RHEjlUJwI4+lU7Hw/fXzbtpQHuaL+HrdGfLgYzXRdMXTYYQ0zAn9mqbriIKvhrwcIL1JZCzMBycUzXnsWl3Ki5lZ5WYYUDpW/UvFun6XAZF2ovTpkn5AUoXXjiO7BuIrDkcrJKMDrjr+7g0HQkWtVtJLrVnMcDENjBPA/fV2yEFtCHLBT0pYbXdavW8wRwGNmxtjYDGPr1rZJHqFzevamOVrgoZD2Ddzg8VbbfCUGtQ1uJNw378nnJpZvdcOdyuA3oDQe6kDs6NK6OpwVI5Bqk9tu5EmapRIWbvVmkzzkmqXtr+lT2U+orz2c+ooqKO/rpLcEsc/Sto01wOCaZrO2jaU+0HCgcDOM/etE8QWZxHygPu0vRh2ARpkrMCTkVufT5Anu0XhVnkCKCSewrZNE8J2yLtyMj51dEsULyKeM7dvU4zTFDpMHh6W31MSPdEe6yEDuPiWtd/CHQFVLHdnArSkSrHmZzwTjd6VaRRo8Saql3Ms0MTwqq8knlvnxSJqXiJAxSPLHuRTdqsloYJV3ZIGcVz2/jhVD5acmqlLV0HDHsrL+meXqDO8xb3Rkr8q3SaiEzHYxBFHG4jFLFjqMtjc7kJK55Hyo5DOtzIWRcA849KOLsXJUXIPNlspjLIWPP06UMjixjiikBVLeWM7g5IIPPIPH+9FdA8KyapA1wZSkYJC4HJxTIxt0gG6QvpHkUD8QrtnWm+7sTZ38lsx3bec0reLV2XKDGKnqVF/QMs7022evNbZ9ckA90t+NDT1ojbaG8oR7x/JikzyvLdMqfTB5wfljrRNIpGl0n1a3MjsgijJWSR2ACZBx19cEfWpcXcVlpy2sKROJI0JhePcEJGS27uT6DH7qevDunwPYGZ4kaIsy24AXai597/ECR19Md+a8uNEsWOTbpx04rHPPGMqNcPHlKNnN9MttTeUS6dbynZ0fHAotLpnii+L3JkmkZFyxV8HHXt9+KereSGwULtAXoQB2ra+tx2x/oy+9zye3aqWZv6KeLX7OZzzjU7qFiri+lO2YSY5cDGfwFFYfCF26h5Zoohj61W8Vusd/Hd2xCtI+5sLjDjv/PpQQ6pc3G4XV1Jgrxgng/SmptqxLVMaG0LRbRd19qe5l6opAzWvHhL9t/8AOaTCWY7mOTXnNXTKPrCW+jYgDoO5NaGu0zjI9KGyWjbfgkVfUoRir2kxQWzrK2GbBHPUfSmyihcZMvtNFaxJOjBXBBHP7qrXeoC4cO+1QBgAUI8QzbrvzV90Y+Hv9aEtMrbDJJgCqUC3MZTOp+E5NLviCW5CcEqDRiwmjeEOhyBjpVHxJMkqxqi96lpOhv4cjx71wWTHGttK9wWORjOck0B1R7eONUtznI5z2poZWMLouORSpd6VfESOsYAXknNKy425bIZhyRjDVlSBRcJ5MS5djjGKM6dZSW7uJVweOKC6c720itg+YrZIrp2madH4i06Oa0kC3IOJFI4FBjdSpkyxuNoWSgzijej6/Lpdo0Cx7s9OcCqetabd6XvW6hKEfC+OG+9J0N5cXF26FvdzjitUZOPUZWhsaf2m7aaZ1MjnoKVvGybbqL5ijWk2/wDSlY5PPehv5QEKXUBxxg0CdysL6BVnaWkVkLq7jSTucScBTxjH7X+vrmqWpai1yfLh3pFtAJbG5/qR2+XTPPeqpdtmzc2zOdueM4xnHritRpoJ0jQb0JoFhbBHVo7ZDllwGzzkfLmq8Wqy3EjiK1IRTgyTNsB+g5NbvDmmmx0O1vbiSV5JrcbIW5VFbkcfQivH0CK6mMyTTBW4kjDnb/l+1c34qTdnVSm4JI2TWT38YaFxnG7aD0pVDzmUxqrO+cYHXrT7aW1vZgeWSG6AD/mg/wCb0lm82GMB2l98nGAoFAppNouWK6EPxIs0bpDOhSRTu2n0I/5oCQKO+KpxcavNswY4lWNCpznHJ5/xM1BDW7H/AMo58+SdEC1ltqKKyxRAH2ReBTaTBumw8falmxjEThnHuleDVu2vLq5TbLMrAjBwgGRVv2ddmKFsuhP1pRJdu69D0oJPGgQl8cU26laqJDQWe0GTwCKdF8EyBVrr3s0RiijJHptqnrGtyeztMUAI6CisunqAWVQCflQHUraNIHe7Ui2Tlz6+n15xnHarcY+6GLNk10t0Ul1aabTzNwDRzw5bS6k8atIc43E44ApYRonsW8iLy4yxKgnJwT3p68JQm1tjOGBBTFDKesWyoQc5pA6Xwf7TeTXEJ8uBDgE/rN8q6DoGmw6Vp0MI93C+9juaFrKRcLGG7bh+NWptehtdNluZoppWhfYY4VBZznHHSsOPInI35cUox4G723ttVspLW4TcjqRk9R9K4vrfhi48O6zsdjJbyktFJjH/AIn5107Q/FWlau/l2d2gnzgwSDZID/hPNa/GRhurQW7wmaZZUPu/EAe9adqXTLrb4ImlD9P96CflDJ9sgGeMU/R2NpDtCRMW6k5xS/4s8KyawyzWVyqSIP8ApyggMPqOlLjmht0OXj5NbOYsK1OMgiimraLqOlEm+tnSPOBKOUP3HFDGrWmn1GemvY8WusQ3Oh2813BNLImIz5bhQu0Aev3rdbaj5qs1tHNGvfzBjcfXNL3hK7s4XurbUUV4pQrRB+iuM8/cH9wo9cXdmFCxEKMcKDWGcYxbVHTxz2imW4pjKwacnH161jdRtNY6peCQs7xtsy2AoA/iaEm78xhHFnJ4+lMkFi13o1xaRghpbeRFx6lDj99Z3ySGy+UXRyG58tXZItzAHlm7n5VXPWs33EksMNnkdwaxUFmAUEknAAGea6KOS2bIkZ2CIpZm4VQOSay2H9lv8tFbXT0sLlDd3MIby3Zcc7MLkOOmTnIxx09avfn6H+0dR/8Ayw/71GWd/wBNZ1Db0Oe2e9XbW4aRmDKQAaHW95JLKCYiqjvViW5BjJiHPyoYolmWqRiRCU60OjtcqC1ZlpJLcnPvH1ryAsIsOcH1psQH7K9/boke9uFA5xXP/Gl0k1uUiGFXPFdEu3W7he3iJBYEZxSD4w8O3djZNJGPNiHJYc4FLeSO1WMUZOHoXoVK6RkZp18N3TNpCRBQdpKsT6HmleOLOgqcdasQ3iabGhnaUQsnPlgEg9uD1pmfH8APFyVkGWKc+cjXEwRViMe7POQR/tUg1gW01w8gadDKRGOoPJ4JoJFNELRLyPdcK4LKki4Bz1z8xg1s8Jaii6ncx3ah4pRhkIBXk1z5JJpo6m1qmEdV0Ow1K29pv/ZxKcPEkTYUY9Gznv1FCNP1TStB/o+o+I55pc5ChyVj56dM/cmmXxRo0aacZdOiRGiO8BO4rlXiaN5rhL2aEJ5nunAwPlTat0xCqKuKOs2eoWF4vm2tzHMrfrK+QasG4hxyQfkK454X01rrUPKgkZJJCcHzCgBxnr9jRqeHWdOeO4h1V72BZNslv03fJXI96qeKEeBQnkmm0jpL3FufdYK8RGGUjOR6Ul+LPBEc6yX/AIcGX6va/wDr6H5Vet76C90+K809LiPdw0UgJLEdSM5/2PaiFnf+YoZGIcfvoIycX8eB5Mey+Ryq50q9dw0OmXgDAZQW8nun9nJHP1pg0DQbr813Y1G3eLeymMSDDD+Irp1vcpdggFVuAOA3wk0Ku4biGTbMMM3LehNVl8iTVUTF48Iu0xRstN9nkCqmefvTbpPmQyIFC5Pw5Ofv9Krq1vHLulTcx4A7Ux6LPp8uFRB5h6s1Z3LY0VS4Jvi/8nMWqXTXmhzrFeuQZbeU4SQ9yp7E+h4+lKB8LXmh+bLc292bpCUjZICRnghkBHvduQcdRXZtU1WKC7S1jjRnZWO/OSmMdu/xDpQN5LsXVyLW7KLN5QaVm3Mh53lRyOmOg61phmlFUxX6LmtvRxbUp72VlW6hktolIxEUKjcBjOOOaoYPofxNd/1Sw0i9s3sJLKWe5uV90SbtxPTexJ4A9fwpD/8AqjUP7Ug/Bqcsqfsz5PDknSOxQ7Ao4rKTy0jZmHAFVbNneJWIxkVZaMyKVPQ9aYmY6Kkl1HHFIRxt61V0u8ivLe4kmUlUbHFeapoct3EUimZQcd6lnoaafpjxLcEyE5IJ60OabUOB4YJzLtpdpNEhjQBe2al7NH5ex8NGwxg9qFCTybQqhAYA4xSzPq0+8q5JTJrn2zc1RNUtYIreSONlSPduXmlrWLhLmALBhvK7g0R1TR5b639pkuXjjz7yg9qt2UGkaHCJ1hec4znrz61vyZ5OMUzJjwQTbRR0lZzo6xSo8YVjgMMg9waGySva3iSA+8rZOBjP2FWX8VmaXZJGFhVuMDoK91CGK5i8+3kRg/Q5rOr6n9mmLXKGc+IYkgRLmQvblQNu3PvHOP8AQfjS54g1eG50+6tZraFHZRtjjAxEQeCT3Pz+f3oAIpU3ruM8xBI2Akn0z2Herlpot5ex+0ykFP1EXuT8+9EscV7ZqnkSh6BdoWin3DuSP3k00Ge8vYRPdoltpiLtJJJeT1IAH1qmNPi0t1k1FUeZR7tqWzg+r47fL6fb3UtRu2hVzOVHQbBgKPlj6U6SUqZhw5pY7S9DNYXDyWo8wx6fbp7kSKVJAx3yMfLFVpontHSWNZZIXUO0oUbee4xS5pd7dye+7rcLGCQAmHTPcAnBzTjBc3N7GI4JY5lZQvlyxbSQBnkg4/dWSVxl06cMmPPDVKjyC6BwSTjqrUw6bfQXcHs+oKHH6rnr+NIye0WtyYLuIQseQobIojFNKsZk2+72Y9KKtkZHcHTGW90ERBpYpGkibsq7mA9MDrS3qt6LdJLRYpYFZCSxkCu2Oy4OeuKN6XrhUhJG46ZrHXdFstdHnJtEwx8XRsHP2+1LrV9NGGaTAWg21zPbNd3bSosIMMUszBiT3Oc8/wCvFMenaddRRLHYuluANzT3CeZJN8+wH88UPmsLgzkG6NuNu0OGKv8Ab9UfXGa1Xbtp/v6hqk1xZbMvBJOAwX9pSOW+lWnbs2SXx4GZpzpMrNcz2s80mCwWMiVvwJP8Ky/Pp/s6/wD8y/71UU6PGIjbzRySSgFI4OWcepHb5k0C/wDmsf8AVp+H/FEk39CJTgvbHPUtVttLhR55AingVlomsRap5pgbKocZrmP5RdVXUNShsbR96rgYB/WPFdH8LaUul6PBCowduSfnWm6RwvsNsT2c1R1KPfasd5BH7PU1vYY71XuJhBGTI2B86CTcuDI/F2hMu7iUzFYmZCvXPGaKHSIJbC3mlK7iAxyMg/Wg+vXUz3U0+PdUbQAvBPOV+ben2pQ1PWfEiwrEJD5YBBO3Bk56kfw7UD8eT9DHnT9jP4l1W1sNJSB2IDO2AVGevQenSk+51rzLLFvKBk/D3FL+o3t1dyq905Zl7HtXkahXZwPhwaasPPkK/M1xei80hcZOcnvWyJpIx+jdlz6Gq24s2F9KtxIdozzRFWGNCuLu7v7ezL+Z5zhBkDK57/brXWo7SzsraO2ghCrGMKR1z6/Wuf8A5P5be0uLy6ltzLNDFuj2jJA74+dNtr4gs9R253wMeAJVK8+mehNImrlw14pvXrBt5oNkkhla3Vs8kmlrXDalRBBbxgffrTf4gllS03xZwPix6UiX06lySOCc0yMJe7F5JRXKKdrcPa6gwHEEkWwLjgelZfnOVVtrlbh4ZIpCjFPTJ2t9uRWmeZSUAH3rZ+YAYi17L+h2FmVWwUA+FiedoPI57jFE8ab6JU2uoNPZ3Wp3C3Rv9sWQC7xjOOeeoB54+pHSiMl8LVDaxnJaNd5Cjb65+vrQGPV3mUWkEhWMOcvF7hRRnIQjBC56fLiq8kSLtlilnZs+7vlZhj6E0vWuG2F5YOT9h1LnY2aOabqPl4DOSppLjuwRtY4cdeasW98Q4GePrVSjtxi1LVnS4tSTyirHK9s0C1fUtOheRcwJKy++pABB7H6UDk1ApEHD7VHXJoLqOp29xA6TxmY8lMLuKn5fXpSoY3sa8efX0NHg+8gbTbgWqI3lTyDzM42IecnuT1ArzyLP/tKpaB7La+FlWWQxxsTJLKDtDsTgD5jpVL2nT/8AvR+NNrpm8qbtHk1jC35QI7J1LOLgNux1HWu0RxBYlXsBXGvDEV5eePbW7uiWkkjLZK7ccV2DVL2LS7Jricg4GAoPxH0pj/hij/WaNSurexi3zMMn4V7ml2+vg58yTDBvh2k547+n8/ag97fTXly8s5O/PAzkKPQVoZ8/ESfrRxh/QXKzZPN50jMQO/2HoPlQjVrqMwlGXORgVsv7tbeIKpy5pb1K4O3Oeho0gRYvJMTyLj9bgmrkKg20zd8CqWpAe2ZHRuaJWcTy2U2zBwM4zyfkPU0RRogcE4opaxPcSRxQxtJK7BURRksT0FBLb/rdeKP6fO9pcRTwPskjIZW9KTIdE6h4f0eLRrPyX2tdSgeew5/8R8hUfw8sU0jRHasnLLnKk/Sla28SX6XkYupC1s4DBivOPkacpdVUxBw2VIyDnrS3baSNaUaMXhENuVkbdge9nuKQVsnv5pUgQABiQScAc+tEfEPiXhoYCSGGCw7Vv8LgnSVUkB5GyznGStOXEJlUnRhD4ajtdHe/cxyyxgyDdnpjlRz1wOCfX0pSvL2S7j8lQUhbhWZs5OerH8Pw5yeab/EWoLBZexxMcykqOeFB4OP57mlCC3itbnfcy7VxhMqdv19KBuyPGtlFG4WdnFZoP0bysPi3V4+nwZXaJOnJErj+NYynT7q7CItqUAxlQvNemzti+Ujx/hYj+NWom5RX0kVrmz2tuhllVh/fzn8arLfyI7IVMhTqV61fNmpYBJp1+spwPxoZJGYrqQLukb9YE+99aLlCskF/Cy2oe0qipIVDHHPr6VlaabM9yiRAyCRgCu7kH5VShlgVyjgZfg7h/rTloegvLbe2TTusWMhEm5x9QaCT1ReKGz1RX8V29tFYW0cjSLvYIV8wlQFHQDp1pR8rTv6yX/N/zRPx6YIDZWloGUANI/JIYnABBPXgUo5q4L4mXyneVn0yfFXhFJRcLqNoZkBA25z9OlJmu+KbbV7tpJLlBAp/RR+nzPzrM+DtEEEdt7Rce1Eor3PnLtRjLtb3c9lZftg9c1Uk8GacJ57ePULl5BFJIhG1VUqE91iVyDlm5wAdvbNMjjijK5tldNVstxZ7tCTgZJPTtXs2r2OzK3CMR2Hets/hXSrrVzb6Zc3EcKMrymR0ISNk9wIT8TuwOOw5z6VQ1/QrDTtKtLuBrkTOrJLA7oXjbfKFZ8E9QqjC8e6T1NGDYJuLwTTF2fjNUtQbzU/RnP0rCpV0XYNvbaZzGyIWI4NEdPLwQMQ5jlwQCvXBr2pUoqwdHBMs7YRtvYmi1mkUksa3Mnlpn3jWqpQuCYSm0NM2rWM0Hly+WVjXaiL2+lBZNZuRB5C7jGowtUKlAsKQcs0mYCWYuTIjYPcHpTBot5bLbqt5OEKZ2DJ/0oFUpmqBU2nYw+Jrq0uRavaXKuyL7wXnafwofDqaxwqpWQOikDjIJPfj60OqUH4kMj5EoytF2BrbY7zBHJ6BhWgw2ROfJiz6gVpqUWof7T/yjaY4AcxyyL8hKcVomU7t6MXdTncx5PqM1lV61FpLGiG1uZZ/1jG4wefTFTQr9l/wGOxdw3kurZznjAo1ZNps6QC7ggRlbDM6AYFajaqQu2yuvhIbnq3yqezxfELK6weh3UMsSZcfKkvoGeLXGpayZLKJzaxRrFGdu3geg9Mk0J9hb+pej1ygjmKiN4wAPdfkitVEoJIRKblJtnmAEzj+eK97n61KlGAeKFJxtHTNZqoOM/zmpUqiGNSpUqyEqVKlQhKlSpUISpUqVCEqVKlQhKlSpUISpUqVCEqAkMMVKlQhNx9T+Ne7iSBk8/OpUqEPO/8AGpUqVCH/2Q==",
                            height:150,width: MediaQuery.of(context).size.width/2,fit: BoxFit.cover,),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Name:Rahul Pawar",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text("Ratings:*****",style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text("Mobile:9766568700",style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text("Email:Email@gmail.com",style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text("Address:Khadki Dapodi, Pune",style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 320,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:
                Column(
                  children: [
                    Container(
                      height: 100,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return
                              GestureDetector(
                                onTap: (){
                                  track=index;
                                  currentDate=dates[index];
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: track==index? Colors.deepPurple:Colors.yellow,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  child: Text(dates[index]),
                                ),
                              );
                          }),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            one=true;
                            two=false;
                            tree=false;
                            four=false;
                            five=false;
                            six=false;
                            seven=false;
                            eight=false;
                            setState(() {

                            });
                          },
                          child:  Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: one?Colors.green:Colors.red,
                            ),
                            child: Text("01:00PM",style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            one=false;
                            two=true;
                            tree=false;
                            four=false;
                            five=false;
                            six=false;
                            seven=false;
                            eight=false;
                            setState(() {

                            });
                          },
                          child:  Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: two?Colors.green:Colors.red,
                            ),
                            child: Text("02:00PM",style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            one=false;
                            two=false;
                            tree=true;
                            four=false;
                            five=false;
                            six=false;
                            seven=false;
                            eight=false;
                            setState(() {

                            });
                          },
                          child:  Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: tree?Colors.green:Colors.red,
                            ),
                            child: Text("03:00PM",style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            one=false;
                            two=false;
                            tree=false;
                            four=true;
                            five=false;
                            six=false;
                            seven=false;
                            eight=false;
                            setState(() {

                            });
                          },
                          child:  Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: four?Colors.green:Colors.red,
                            ),
                            child: Text("04:00PM",style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            one=false;
                            two=false;
                            tree=false;
                            four=false;
                            five=true;
                            six=false;
                            seven=false;
                            eight=false;
                            setState(() {

                            });
                          },
                          child:  Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: five?Colors.green:Colors.red,
                            ),
                            child: Text("05:00PM",style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            one=false;
                            two=false;
                            tree=false;
                            four=false;
                            five=false;
                            six=true;
                            seven=false;
                            eight=false;
                            setState(() {

                            });
                          },
                          child:  Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: six?Colors.green:Colors.red,
                            ),
                            child: Text("06:00PM",style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            one=false;
                            two=false;
                            tree=false;
                            four=false;
                            five=false;
                            six=false;
                            seven=true;
                            eight=false;
                            setState(() {

                            });
                          },
                          child:  Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: seven?Colors.green:Colors.red,
                            ),
                            child: Text("07:00PM",style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            one=false;
                            two=false;
                            tree=false;
                            four=false;
                            five=false;
                            six=false;
                            seven=false;
                            eight=true;
                            setState(() {

                            });
                          },
                          child:  Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: eight?Colors.green:Colors.red,
                            ),
                            child: Text("08:00PM",style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        )
                      ],
                    ),
            GestureDetector(
              onTap: (){
                getBooking();
              },
              child:Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Book Now"),
              ),
            ),

                  ],
                ),
              )
            ],
          ),
      )
    );
  }
}