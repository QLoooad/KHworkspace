
/* 유효성 검사 진행 여부 확인용 객체 */
// -> 모든 value가 true인 경우에만 회원 가입 진행
const checkObj = {
  "memberEmail" : false,
  "memberPw" : false,
  "memberPwConfirm" : false,
  "memberNickname" : false,
  "memberUrl" : false,
  "authKey" : false // 인증키
};

// ----------------------------------------------- 이메일 유효성 검사 -----------------------------------------------
const memberEmail = document.getElementById("memberEmail");
const emailMessage = document.getElementById("emailMessage");

// 이메일이 입력될 때 마다
memberEmail.addEventListener("input", () => {

    // 입력된 이메일이 없을 경우
    if(memberEmail.value.trim().length == 0){
        memberEmail.value = ""; 

        emailMessage.innerText = "메일을 받을 수 있는 이메일을 입력해주세요.";

        // confirm, error 클래스 삭제해서 검정 글씨로 만들기
        emailMessage.classList.remove("confirm", "error");

        checkObj.memberEmail = false; // 빈칸 == 유효 X
        return;
    }


    // 정규 표현식을 이용해서 유효한 형식이지 판별
    // 1) 정규표현식 객체 생성
    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    // 2) 입력 받은 이메일과 정규식 일치 여부 판별
    if(  regEx.test(memberEmail.value)  ){ // 유효한 경우

        /****************************************************************************/
        /* fetch() api를 이용한 ajax(비동기 통신) */
        // GET방식 ajax 요청(파라미터를 쿼리스트링으로)
        fetch('/dupCheck/email?email=' + memberEmail.value)

        .then(response => response.text()) // 응답객체 -> 파싱(parsing, 데이터 형태 변환)
        
        .then(count => {
            // 중복되면 1, 중복 아니면 0

            if(count == 0){
                emailMessage.innerText = "사용 가능한 이메일 입니다.";
                emailMessage.classList.add("confirm"); // .confirm 스타일 적용
                emailMessage.classList.remove("error"); // .error 스타일 제거
                checkObj.memberEmail = true; // 유효 O
            }else{
                emailMessage.innerText = "이미 사용중인 이메일 입니다.";
                emailMessage.classList.remove("confirm"); // .confirm 스타일 적용
                emailMessage.classList.add("error"); // .error 스타일 제거
                checkObj.memberEmail = false; // 유효 O
            }

        }) // 파싱한 데이터를 이용해서 수행할 코드 작성

        .catch(err => console.log(err)); // 예외처리
        
    } else{ // 유효하지 않은 경우(무효인 경우)
        emailMessage.innerText = "이메일 형식이 유효하지 않습니다";
        emailMessage.classList.add("error"); // .error 스타일 적용
        emailMessage.classList.remove("confirm"); // .confirm 스타일 제거

        checkObj.memberEmail = false; // 유효 X
    }
});
// ----------------------------------------------- 이메일 유효성 검사 끝 -----------------------------------------------
// ----------------------------------------------- 비밀번호 유효성 검사 시작 -----------------------------------------------
// 비밀번호/비밀번호 확인 유효성 검사
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage1 = document.getElementById("pwMessage1");
const pwMessage2 = document.getElementById("pwMessage2");

// 비밀번호 입력 시 유효성 검사
memberPw.addEventListener("input", () => {

    // 비밀번호가 입력되지 않은 경우
    if(memberPw.value.trim().length == 0){
        memberPw.value = ""; // 띄어쓰지 못넣게 하기

        pwMessage1.innerText = "6글자 이상의 영어, 숫자, 특수문자를 포함한 비밀번호를 입력해 주세요.";
        pwMessage1.classList.remove("confirm", "error"); // 검정 글씨

        checkObj.memberPw = false; // 빈칸 == 유효 X
        return;
    }

    // 정규 표현식을 이용한 비밀번호 유효성 검사

    // 6~ 영문 대소문자, 최소 1개의 숫자 혹은 특수 문자 포함
    const regEx = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/;

    // 입력한 비밀번호가 유효한 경우
    if(regEx.test(memberPw.value)){
        checkObj.memberPw = true; 
        
        // 비밀번호가 유효하게 작성된 상태에서
        // 비밀번호 확인이 입력되지 않았을 때
        if(memberPwConfirm.value.trim().length == 0){

            pwMessage1.innerText = "유효한 비밀번호 형식입니다";
            pwMessage1.classList.add("confirm");
            pwMessage1.classList.remove("error");
        
        }else{
            // 비밀번호가 유효하게 작성된 상태에서
            // 비밀번호 확인이 입력되어 있을 때

            // 비밀번호 == 비밀번호 확인  (같을 경우)
            if(memberPw.value == memberPwConfirm.value){
                pwMessage2.innerText = "비밀번호가 일치합니다";
                pwMessage2.classList.add("confirm");
                pwMessage2.classList.remove("error");
                checkObj.memberPwConfirm = true;
                
            } else{ // 다를 경우
                pwMessage2.innerText = "비밀번호가 일치하지 않습니다";
                pwMessage2.classList.add("error");
                pwMessage2.classList.remove("confirm");
                checkObj.memberPwConfirm = false;
            }
        }

        
    } else{ // 유효하지 않은 경우
        
        pwMessage1.innerText = "비밀번호 형식이 유효하지 않습니다";
        pwMessage1.classList.add("error");
        pwMessage1.classList.remove("confirm");
        checkObj.memberPw = false; 
    }
});

// 비밀번호 확인 유효성 검사
memberPwConfirm.addEventListener('input', ()=>{

    if(checkObj.memberPw){ // 비밀번호가 유효하게 작성된 경우에

        // 비밀번호 == 비밀번호 확인  (같을 경우)
        if(memberPw.value == memberPwConfirm.value){
            pwMessage2.innerText = "비밀번호가 일치합니다";
            pwMessage2.classList.add("confirm");
            pwMessage2.classList.remove("error");
            checkObj.memberPwConfirm = true;
            
        } else{ // 다를 경우
            pwMessage2.innerText = "비밀번호가 일치하지 않습니다";
            pwMessage2.classList.add("error");
            pwMessage2.classList.remove("confirm");
            checkObj.memberPwConfirm = false;
        }

    } else { // 비밀번호가 유효하지 않은 경우
        checkObj.memberPwConfirm = false;
    }
});
// ----------------------------------------------- 비밀번호 유효성 검사 끝 -----------------------------------------------
// ----------------------------------------------- 이메일 인증 시작 -----------------------------------------------
// 인증번호 발송
const sendAuthKeyBtn = document.getElementById("sendAuthKeyBtn");
const authKeyMessage = document.getElementById("authKeyMessage");
let authTimer;
let authMin = 4;
let authSec = 59; 

// 인증번호를 발송한 이메일 저장
let tempEmail;

sendAuthKeyBtn.addEventListener("click", function(){
    authMin = 4;
    authSec = 59;

    checkObj.authKey = false;

    if(checkObj.memberEmail){ // 중복이 아닌 이메일인 경우


        /* fetch() API 방식 ajax */
        fetch("/sendEmail/signUp?email="+memberEmail.value)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                console.log("인증 번호가 발송되었습니다.")
                tempEmail = memberEmail.value;
            }else{
                console.log("인증번호 발송 실패")
            }
        })
        .catch(err => {
            console.log("이메일 발송 중 에러 발생");
            console.log(err);
        });
        

        alert("인증번호가 발송 되었습니다.");

        
        authKeyMessage.innerText = "05:00";
        authKeyMessage.classList.remove("confirm");

        authTimer = window.setInterval(()=>{

            authKeyMessage.innerText = "0" + authMin + ":" + (authSec<10 ? "0" + authSec : authSec);
            
            // 남은 시간이 0분 0초인 경우
            if(authMin == 0 && authSec == 0){
                checkObj.authKey = false;
                clearInterval(authTimer);
                return;
            }

            // 0초인 경우
            if(authSec == 0){
                authSec = 60;
                authMin--;
            }


            authSec--; // 1초 감소

        }, 1000)

    } else{
        alert("중복되지 않은 이메일을 작성해주세요.");
        memberEmail.focus();
    }

});


// 인증 확인
const authKey = document.getElementById("authKey");
const checkAuthKeyBtn = document.getElementById("checkAuthKeyBtn");

checkAuthKeyBtn.addEventListener("click", function(){

    if(authMin > 0 || authSec > 0){ // 시간 제한이 지나지 않은 경우에만 인증번호 검사 진행
        /* fetch API */
        const obj = {"inputKey":authKey.value, "email":tempEmail}
        const query = new URLSearchParams(obj).toString()
        fetch("/sendEmail/checkAuthKey?" + query)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                clearInterval(authTimer);
                authKeyMessage.innerText = "인증되었습니다.";
                authKeyMessage.classList.add("confirm");
                checkObj.authKey = true;

            } else{
                alert("인증번호가 일치하지 않습니다.")
                checkObj.authKey = false;
            }
        })
        .catch(err => console.log(err));


    } else{
        alert("인증 시간이 만료되었습니다. 다시 시도해주세요.")
    }

});

// ----------------------------------------------- 이메일 인증 끝 -----------------------------------------------



/* 이메일 전송 버튼 눌렀을 때 */
const certisend = document.querySelector(".certi-send");
const certiresend = document.querySelector(".certi-resend");
const emailsend = document.querySelector(".email-send");
const email = document.querySelector(".signup-input-email input");

certisend.addEventListener("click",()=>{
  if(email.value.trim().length!==0){  
    emailsend.style.display="block";
    email.style.border="1px solid green";
    email.focus(); // 비밀번호 확인에 초점을 맞춥
    e.preventDefault();
  }
})

/* 비밀번호 일치 확인 */
// 다음 페이지 넘어가는 버튼 눌렀을 떄
const signupNext = document.querySelector(".signup-next");
const userPassword = document.querySelector(".signup-input-password>input");
const userPasswordCorrect = document.querySelector(".signup-password-check>input");
const pwInconsistency=document.querySelector(".pwInconsistency");


document.querySelector(".signup-box").addEventListener("submit",e=>{
  if(userPassword.value!==userPasswordCorrect.value){
    alert("비밀번호를 맞게 입력해주세요.");
    userPasswordCorrect.style.outline="1px solid red";
    pwInconsistency.style.display="block";
    userPasswordCorrect.value="";
    userPasswordCorrect.focus(); // 비밀번호 확인에 초점을 맞춥
    e.preventDefault();
  }
});


/* 약관 확인하기 창 열기 */
const openTermsBtn = document.getElementsByClassName("open-termsBtn");

openTermsBtn[0].addEventListener("click", () => {
  document.getElementsByClassName("termsbackground")[0].style.display="block";
});


/* 약관 확인하기 창 닫기 */
const closeSignupBtn = document.getElementsByClassName("close-signup-terms")[0];
closeSignupBtn.addEventListener("click", () => {
    document.getElementsByClassName("termsbackground")[0].style.display = 'none';
});


