// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract Seller{
    address master = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;//мастер не один//ДОБ структ мастера
    struct Auto{
        address owner;//добавить марку модель //маппинг добавить 
        string color; 
    }
    struct PaintAuto {
        address owner;
        uint adresAuto;
        string newColor;
        uint price;//мастер цена
        bool paint;//выст на покраску
        bool approval;//щценина или нет
        
    }
    Auto[] public masAuto;
    PaintAuto[] public masPaintAuto;
//  добавление машины
    function addAuto(address _owner,string memory _color) public {
        masAuto.push(Auto(_owner, _color));
    }
// выставка на оценку покараски
    function sendingforEvaluation(uint _auto,string memory _color) public {
        require(msg.sender == masAuto[_auto].owner,"You are not the owner");//добавить проверку на то что заявки еще нет
        // require(mas[_auto].paint == true); через цикл
        masPaintAuto.push(PaintAuto(msg.sender,_auto,_color,0,true,false));
    }
// оценка стоимости покраски
    function estimation(uint _Auto,uint _price) public {
        require(msg.sender == master,"You are not the master");
        require(masPaintAuto[_Auto].paint == true);
        require(masPaintAuto[_Auto].price == 0 );
        masPaintAuto[_Auto].price = _price;
    }
    // соглание на покраску
    function approval(uint _auto) public payable{
        require(msg.sender == masPaintAuto[_auto].owner,"You are not the owner");
        require(masPaintAuto[_auto].price != 0,"not rated yet");
        masPaintAuto[_auto].approval = true;
        payable(msg.sender).transfer(masPaintAuto[_auto].price);
    }
    // отмена покраски
    function cancellation(uint _auto) public {
        require(msg.sender == masPaintAuto[_auto].owner,"You are not the owner");
        masPaintAuto[_auto].approval = false;
        masPaintAuto[_auto].paint == false;
       
    }
    // покраска
    function painting(uint _auto)public {
        require(masPaintAuto[_auto].approval == true,"not apporol");
        require(masPaintAuto[_auto].paint == false,"not price");
        require(msg.sender == master,"not master");
        masPaintAuto[_auto].paint == false;
        masPaintAuto[_auto].approval = false;
        uint adresAuto = masPaintAuto[_auto].adresAuto;
        masAuto[adresAuto].color = masPaintAuto[_auto].newColor;


    }
}  
///////////////////////////////////
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract Seller{
    address master = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;//мастер не один//ДОБ структ мастера
    struct Auto{
        // address owner;//добавить марку модель //маппинг добавить 
        string color; 
        string firm;
        string numer;
    }
    struct PaintAuto {
        uint adresAuto;
        string newColor;
        uint price;//мастер цена
        bool paint;//выст на покраску
        bool approval;//щценина или нет
        
    }
    struct Master{
        address master;
    }
    
    // PaintAuto[] public masPaintAuto;
    mapping (address =>  Auto) AutoMas;
    mapping (address => PaintAuto) PaintMas;
    Auto[] public masAuto;

//  добавление машины
    function addAuto(string memory _color, string memory _firm,string memory _num) public {
        AutoMas[msg.sender] = (Auto(_color,_firm,_num));
    }
    function cons (string _color,uint num_){
        AutoMas[num_][msg.sender].color = _color;
    }
// // выставка на оценку покараски
//     function sendingforEvaluation(uint _auto,string memory _color) public {
//         require(msg.sender == masAuto[_auto].owner,"You are not the owner");//добавить проверку на то что заявки еще нет
//         // require(mas[_auto].paint == true); через цикл
//         masPaintAuto.push(PaintAuto(msg.sender,_auto,_color,0,true,false));
//     }
// // оценка стоимости покраски
//     function estimation(uint _Auto,uint _price) public {
//         require(msg.sender == master,"You are not the master");
//         require(masPaintAuto[_Auto].paint == true);
//         require(masPaintAuto[_Auto].price == 0 );
//         masPaintAuto[_Auto].price = _price;
//     }
//     // соглание на покраску
//     function approval(uint _auto) public payable{
//         require(msg.sender == masPaintAuto[_auto].owner,"You are not the owner");
//         require(masPaintAuto[_auto].price != 0,"not rated yet");
//         masPaintAuto[_auto].approval = true;
//         payable(msg.sender).transfer(masPaintAuto[_auto].price);
//     }
//     // отмена покраски
//     function cancellation(uint _auto) public {
//         require(msg.sender == masPaintAuto[_auto].owner,"You are not the owner");
//         masPaintAuto[_auto].approval = false;
//         masPaintAuto[_auto].paint == false;
       
//     }
//     // покраска
//     function painting(uint _auto)public {
//         require(masPaintAuto[_auto].approval == true,"not apporol");
//         require(masPaintAuto[_auto].paint == false,"not price");
//         require(msg.sender == master,"not master");
//         masPaintAuto[_auto].paint == false;
//         masPaintAuto[_auto].approval = false;
//         uint adresAuto = masPaintAuto[_auto].adresAuto;
//         masAuto[adresAuto].color = masPaintAuto[_auto].newColor;


//     }
}  

////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract Seller{
    address master = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;//мастер не один//ДОБ структ мастера
    struct Auto{
        // address owner;//добавить марку модель //маппинг добавить 
        string color; 
        string firm;
        string numer;
    }
    struct PaintAuto {
        uint adresAuto;
        string newColor;
        uint price;//мастер цена
        bool paint;//выст на покраску
        bool approval;//щценина или нет
        
    }
    struct Master{
        address master;
    }
    // Auto[] public masAuto;
    // PaintAuto[] public masPaintAuto;
    mapping (address => Auto) AutoMas;
    mapping (address => PaintAuto)

//  добавление машины
    function addAuto(address _owner,string memory _color) public {
        masAuto.push(Auto(_owner, _color));
    }
// выставка на оценку покараски
    function sendingforEvaluation(uint _auto,string memory _color) public {
        require(msg.sender == masAuto[_auto].owner,"You are not the owner");//добавить проверку на то что заявки еще нет
        // require(mas[_auto].paint == true); через цикл
        masPaintAuto.push(PaintAuto(msg.sender,_auto,_color,0,true,false));
    }
// оценка стоимости покраски
    function estimation(uint _Auto,uint _price) public {
        require(msg.sender == master,"You are not the master");
        require(masPaintAuto[_Auto].paint == true);
        require(masPaintAuto[_Auto].price == 0 );
        masPaintAuto[_Auto].price = _price;
    }
    // соглание на покраску
    function approval(uint _auto) public payable{
        require(msg.sender == masPaintAuto[_auto].owner,"You are not the owner");
        require(masPaintAuto[_auto].price != 0,"not rated yet");
        masPaintAuto[_auto].approval = true;
        payable(msg.sender).transfer(masPaintAuto[_auto].price);
    }
    // отмена покраски
    function cancellation(uint _auto) public {
        require(msg.sender == masPaintAuto[_auto].owner,"You are not the owner");
        masPaintAuto[_auto].approval = false;
        masPaintAuto[_auto].paint == false;
       
    }
    // покраска
    function painting(uint _auto)public {
        require(masPaintAuto[_auto].approval == true,"not apporol");
        require(masPaintAuto[_auto].paint == false,"not price");
        require(msg.sender == master,"not master");
        masPaintAuto[_auto].paint == false;
        masPaintAuto[_auto].approval = false;
        uint adresAuto = masPaintAuto[_auto].adresAuto;
        masAuto[adresAuto].color = masPaintAuto[_auto].newColor;


    }
}  

///////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract Seller{
    address master = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    struct Auto{
        address owner;
        string color; 
    }
    struct PaintAuto {
        address owner;
        uint adresAuto;
        string newColor;
        uint price;
        bool paint;
        bool approval;
        
    }
    Auto[] public masAuto;
    PaintAuto[] public masPaintAuto;
//  добавление машины
    function addAuto(address _owner,string _color) public {
        masAuto.push(Auto(_owner,_color));
    }
// выставка на оценку покараски
    function sendingforEvaluation(uint _auto,string _color) public {
        require(msg.sender == masAuto[_auto].owner,"You are not the owner");
        masPaintAuto.push(Auto(msg.sender,_auto,_color,0,true,false));
    }
// оценка стоимости покраски
    function estimation(uint _Auto,uint _price) public {
        require(msg.sender == master,"You are not the master");
        require(masPaintAuto[_Auto].paint == true);
        masPaintAuto[_Auto].price = _price;
    }
    // соглание на покраску
    function approval(uint _auto) public payable{
        require(msg.sender == masPaintAuto.[_auto].owner,"You are not the owner");
        require(masPaintAuto[_auto].price == 0,"not rated yet");
        masPaintAuto[_auto].approval = true;
        payable(msg.sender).transfer(masPaintAuto[_auto].price);
    }
    // отмена покраски
    function cancellation(uint _auto) public {
        require(msg.sender == masPaintAuto.[_auto].owner,"You are not the owner");
        masPaintAuto[_auto].approval = false;
        masPaintAuto[_auto].paint == false;
       
    }
    // покраска
    function painting(uint _auto){
        require(masPaintAuto[_auto].approval == true,"not apporol");
        require(masPaintAuto[_auto].paint == false,"not price");
        require(msg.sender == master,"not master");
        masPaintAuto[_auto].paint == false;
        masPaintAuto[_auto].approval = false;
        masAuto[masPaintAuto[_auto].adresAuto] = masPaintAuto[_auto].color


    }
}  
