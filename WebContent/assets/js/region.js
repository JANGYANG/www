$(document).ready(function() {
  console.log("Called region.js")
  var region_a_option = [{ id: '0', text: '구/시'}, { id: '1', text: '서울특별시' }, { id: '2', text: '경기도' }];
  var region_b_option = new Array();
  // region_b_option[0] = new Array();
  region_b_option[1] = [{id: '0', text: '시/구/군'}, { id: '1', text: '강남구' }, { id: '2', text: '강동구' }, { id: '3', text: '강북구' }, { id: '4', text: '강서구' }, { id: '5', text: '관악구' }, { id: '6', text: '광진구' }, { id: '7', text: '구로구' }, { id: '8', text: '금천구' }, { id: '9', text: '노원구' }, { id: '10', text: '도봉구' }, { id: '11', text: '동대문구' }, { id: '12', text: '동작구' }, { id: '13', text: '마포구' }, { id: '14', text: '서대문구' }, { id: '15', text: '서초구' }, { id: '16', text: '성동구' }, { id: '17', text: '성북구' }, { id: '18', text: '송파구' }, { id: '19', text: '양천구' }, { id: '20', text: '영등포구' }, { id: '21', text: '용산구' }, { id: '22', text: '은평구' }, { id: '23', text: '종로구' }, { id: '24', text: '중구' }, { id: '25', text: '중랑구' }];
  // console.log(region_b[0][1]);
  // region_c = new Array();
  region_b_option[2] = [{ id: '1', text: '가평군' }, { id: '2', text: '고양시' }, { id: '3', text: '과천시' }, { id: '4', text: '광명시' }, { id: '5', text: '광주시' }, { id: '6', text: '구리시' }, { id: '7', text: '군포시' }, { id: '8', text: '김포시' }, { id: '9', text: '남양주시' }, { id: '10', text: '동두천시' }, { id: '11', text: '부천시' }, { id: '12', text: '성남시' }, { id: '13', text: '수원시' }, { id: '14', text: '시흥시' }, { id: '15', text: '안산시' }, { id: '16', text: '안성시' }, { id: '17', text: '안양시' }, { id: '18', text: '양주시' }, { id: '19', text: '양평군' }, { id: '20', text: '여주시' }, { id: '21', text: '연쳔군' }, { id: '22', text: '오산시' }, { id: '23', text: '용인시' }, { id: '24', text: '의왕시' }, { id: '25', text: '의정부시' }, { id: '26', text: '이천시' }, { id: '27', text: '파주시' }, { id: '28', text: '평택시' }, { id: '29', text: '포천시' }, { id: '30', text: '하남시' }, { id: '31', text: '화성시' }];

  var mRegion_a = $('#mRegion_a');
  var mRegion_b = $('#mRegion_b');
  var region_a = $('#region_a');
  var region_b = $('#region_b');

  // 지역
  mRegion_a.select2({
    placeholder: "Select",
    data: region_a_option
  });
  mRegion_b.select2({
    placeholder: "Select Second",
    // data: region_b
  });

  // $mRegion_b.prop("disabled", true);

  mRegion_a.change(function(){
    console.log("change active");
    console.log(mRegion_a.val());
    $case = mRegion_a.val();
    if ($case == '' || $case == 0){
      mRegion_b.prop("disabled", true);
    }else if($case == 1){
      // 서울시
      console.log("case = 1");
      mRegion_b.empty();
      mRegion_b.select2({
      data: region_b_option[$case]
    });
      mRegion_b.prop('disabled', false);
    }else if($case == 2){
      // 경기도
      console.log("case = 2");
      mRegion_b.empty();
      mRegion_b.select2({
      data: region_b_option[$case]
    });
      mRegion_b.prop('disabled', false);
    }
  });

  mRegion_b.change(function(){
    region_a.val(mRegion_a.val());
    region_b.val(mRegion_b.val());
  });



});
