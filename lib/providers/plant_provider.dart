import 'package:capstone_project/screens/menanam_tanaman_screens/all_plant_screen.dart';
import 'package:capstone_project/screens/menanam_tanaman_screens/detail_plant_screen.dart';
import 'package:capstone_project/services/plant_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/menanam_tanaman_screens/planting_form_screen.dart';

class PlantProvider extends ChangeNotifier{
  String appBarText = 'Pilih Jenis Tanaman';
  Icon searchIcon = Icon(Icons.search, color: Colors.black,);

  //search field
  bool isSearching = false;
  bool seeAllPlantType = false;
  String searchHinText =  'Cari Tanaman';
  bool enableSearch = false;
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  // FocusNode searchFocusNode = FocusNode();

  String headPlantTypeText = 'Jenis Tanaman';
  String allPlantNavigatorText = 'Lihat semua';

  void allPlantNavigatorOnTap(BuildContext context) async{
    // seeAllPlantType = true;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AllPlantScreen()),
    );
    notifyListeners();
  }

  bool setSeeAllPlantTypeFalse(){
    notifyListeners();
    return seeAllPlantType = false;
  }

  String headLastPlantText = 'Tanaman Terakhir';

  void search() async{
    isSearching = true;
    enableSearch = true;
    // _searchFocusNode.requestFocus();
    notifyListeners();
  }

  bool setIsSearchingFalse(){
    notifyListeners();
    enableSearch = false;
    return isSearching = false;
  }

  //IsSearchingFalse

  //see all plant
  String AllPlantScreenAppBarText = 'Semua Tanaman';
  TextEditingController searchAllPlantController = TextEditingController();
  String searchAllPlantHint = 'Cari tanaman';
  int idPlant = 0;

  void seeDetailPlant({
    required BuildContext context,
    int? id,
    // required int idPlant,
  }) async{
      this.idPlant = id!;
      print('id : $id');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPlant()),
      );
    notifyListeners();
  }


  //detail plant by id
  String detailPlantAppBarText = 'Detail Halaman';

  // Future detailPlant() async{
  //   try{
  //     await PlantApi().getPlantById(id: this.idPlant);
  //     notifyListeners();
  //   }catch(e){}
  //   notifyListeners();
  // }

  Color aboutPlantColor = Color(0xffDCEEE8);
  String jenisTanamanIcon = 'assets/images/menanam tanaman images/icons in plant detail/Jenis.png';
  String techIcon = 'assets/images/menanam tanaman images/icons in plant detail/Teknologi.png';
  String varietyIcon = 'assets/images/menanam tanaman images/icons in plant detail/Varietas.png';
  String toolTextHead = 'Alat yang dibutuhkan';
  String guideTextHead = 'Langkah Penanaman';
  String musimTextHead = 'Kelender Bercocok Tanam';
  String subHeadKemarau = 'Musim Kemarau';
  String subHeadHujan = 'Musim Hujan';
  String aboutFertilizerTextHead = 'Informasi Nutrisi dan Pupuk';
  String aboutPestTextHead = 'Informasi Penanganan Hama';
  bool customExpandedIconFertilizer = false;
  bool customExpandedIconPest = false;

  void onExpansionChangedFertilizer(bool expanded){
    this.customExpandedIconFertilizer = expanded;
    notifyListeners();
  }

  void onExpansionChangedPest(bool expanded){
    this.customExpandedIconPest = expanded;
    notifyListeners();
  }

  Color menanamButtonColor = Color(0xff36725D);
  String mulaiMenanamButton = 'Menanam';

  void goToPlantingForm({
    required BuildContext context,
    // required String plantImagePlantingForm,
    // required String plantName,
  }){
    plantImagePlantingForm = this.plantImagePlantingForm;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => PlantingFormScreen()),
      ),
    );
    notifyListeners();
  }

  //planting form
  Color formBorderColor = Color(0xff6EB99F);
  Color formTextColor = Color(0xff36725D);

  String appBarPlantingFormText = 'Formulir Menanam';
  String plantImagePlantingForm = 'code anjing';
  String formTextHead = 'Mohon isi data terlebih dahulu';
  TextEditingController jumlahBibitController = TextEditingController();
  String jumlahBibitHint = 'input';
  Color jumlahBibitHintColor = Color(0xff295646);
  String jumlahBibitLabel = 'Jumlah Bibit';
  String inputBibitWarntext = 'Masukan jumlah bibit yang akan ditanam';
  String inputUkuranPertumbuhanTextHead = 'Mengukur Pertumbuhan';
  String radioValue = '';
  String inputUkuranPertumbuhanWarntext = 'Pilih pengukuran yang sesuai untuk tanaman.';

  void onChangedRadioValue(String value){
    this.radioValue = value;
    print('radioValue : $radioValue');
    notifyListeners();
  }

  String radio1TitleText = 'Berat';
  String radio2TitleText = 'Tinggi';
  String radio3TitleText = 'Jumlah';
  DateTime date = DateTime.now();
  String formattedDate = DateFormat.yMMMd().format(DateTime.now());

  Future chooseDate(BuildContext context) async{
    DateTime? setDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2022),
      lastDate: DateTime(2050),
    );

    if(setDate !=null && setDate != date){
      date = setDate;
      formattedDate = DateFormat.yMMMd().format(date);
      notifyListeners();
    }
    notifyListeners();
  }
}