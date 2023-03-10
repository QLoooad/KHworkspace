package edu.kh.collection.list.view;

import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

import edu.kh.collection.list.dto.Student;
import edu.kh.collection.list.service.StudentService;

public class StudentView {
	
	private Scanner sc = new Scanner(System.in);
	private StudentService service = new StudentService();
	
	public void displayMenu() {
		int input = 0;
		
		do {
			try {
				System.out.println("\n--- 학생 관리 프로그램 ---\n");
				System.out.println("1. 학생 정보 추가");
				System.out.println("2. 학생 전체 조회");
				System.out.println("3. 학생 정보 수정");
				System.out.println("4. 학생 정보 제거");
				System.out.println("5. 학생 이름 검색");
				System.out.println("6. 학생 주소 검색");
				System.out.println("7. 학년별 조회");
				System.out.println("8. 성별 조회");
				System.out.println("9. 성적 조회");
				System.out.println("0. 프로그램 종료");
				
				System.out.print("메뉴 선택 >> ");
				input = sc.nextInt();
				sc.nextLine();	//입력 버퍼 개행문자 제거
				System.out.println();
				
				switch (input) {
				case 1 : addStudent(); break;
				case 2 : selectAll(); break;
				case 3 : updateStudent(); break;
				case 4 : removeStudent(); break;
				case 5 : selectName(); break;
				case 6 : selectAddress(); break;
				case 7 : selectGrade(); break;
				case 8 : selectGender(); break;
				case 9 : sortScore(); break;
				case 0 : System.out.println("[프로그램 종료]");break;
				default : System.out.println("[메뉴에 존재하는 번호만 입력 해주세요]");
				}
				
			}catch(InputMismatchException e){
				System.out.println("[잘못된 형식의 입력입니다.]");
				sc.nextLine();//입력버퍼에 잘못 입력된 내용 제거
				input = -1;//반복문 종료 방지
			}
		}while(input != 0);
		
	}
	
	
	/**학생 추가하기
	 * 
	 */
	private void addStudent() {
		
		System.out.println("\n--- 학생 정보 추가 ---\n");
		
		//학생 정보 입력 메서드 호출 후 결과 반환 받기
		Student std = inputStudent();
		
		if(service.addStudent(std)) {
			System.out.println("[학생 정보가 추가되었습니다.]");
		}
		
	}
	
	/**전체 학생 조회
	 * */
	private void selectAll() {
		
		System.out.println("\n--- 전체 학생 조회 ---\n");
		
		List<Student> list = service.selectAll();
		
		for(Student l : list) {
//			System.out.println(l.toString());
			System.out.println(l);
			
			//toString() 하지 않아도 출력 되는 이유
			//print 관련 메서드
			//참조변수를 출력하기위해 매개변수로 전달하면
			//자동으로 toString()를 붙여서 호출(컴파일러)
		}
		
	}
	
	/**학생 정보 수정
	 * */
	private void updateStudent() {
		System.out.println("\n--- 학생 정보 수정 ---\n");
		
		System.out.println("<수정할 학생 정보 입력>");
		
		//학생 정보 입력 메서드 호출 후 결과 반환 받기
		Student std = inputStudent();
		
		System.out.println("--------------------------------");
		System.out.print("수정할 학생의 index : ");
		int index = sc.nextInt();
		sc.nextLine();
		
		Student s = service.updateStudent(index, std);
		// s == 수정되기 전 학생 정보 반환됨
		
		System.out.println(s.getName() + "의 정보가 수정 되었습니다.");
	}
	
	
	
	/**학생 전체 정보 입력받아 Student 객체로 반환하는 메서드
	 * @return std : Studetn
	 */
	private Student inputStudent() {

		System.out.print("이름 : ");
		String name = sc.nextLine();
		
		System.out.print("학년 : ");
		int grade = sc.nextInt();
		sc.nextLine();
		
		System.out.print("반 : ");
		int classRoom = sc.nextInt();
		sc.nextLine();
		
		System.out.print("번호 : ");
		int number = sc.nextInt();
		sc.nextLine();
		
		System.out.print("주소 : ");
		String address = sc.nextLine();
		
		System.out.print("성별(M/F) : ");
		char gender = sc.next().toUpperCase().charAt(0);
		
		System.out.print("점수 : ");
		int score = sc.nextInt();
		sc.nextLine();
		
		Student std = new Student(name, grade, classRoom, number, address, gender, score);
		
		return std;
	}
	
	/**학생 정보 제거
	 * */
	private void removeStudent(){
		
		System.out.println("\n--- 학생 정보 제거 ---\n");
		System.out.print("삭제할 학생의 인덱스 입력 : ");
		int index = sc.nextInt();
		
		//제거되기 전 학생 정보가 반환됨
		Student s = service.removeStudent(index);
		
		System.out.println(s.getName() + "학생 정보가 제거되었습니다.");
		
	}
	
	/**학생 이름 검색
	 * */
	private void selectName() {
		
		System.out.println("\n--- 학생 이름 검색 ---\n");
		
		System.out.print("검색할 학생 이름 : ");
		String stdName = sc.nextLine();
		
//		System.out.println("요청한 학생(" + stdName + ")의 정보입니다.");
//		if(service.selectName(stdName) != null) {
//			System.out.println(service.selectName(stdName));
//		}else {
//			System.out.println("검색 결과가 없습니다.");
//		}
		
		//---------------------강사님 코드---------------------
		List<Student> list = service.selectName(stdName);
		
		//검색결과가 없을경우
		//list.size() : 리스트 객체 수
//		if(list.size() == 0) {} //저장된 객체 == 0
		if(list.isEmpty()) { //리스트에 저장된 객체 없을 경우  true
			System.out.println("검색 결과가 없습니다.");
		}else {
			for(Student s : list) {
				System.out.println(s);
			}
		}
		
	}
	
	
	/**학생 주소 검색
	 * */
	private void selectAddress() {
		System.out.println("\n--- 학생 주소 검색 ---\n");
		System.out.print("검색할 주소 : ");
		String stdAddress = sc.nextLine();
		
		List<Student> list = service.selectAddress(stdAddress);
		
		if(list.isEmpty()) { //리스트에 저장된 객체 없을 경우  true
			System.out.println("검색 결과가 없습니다.");
		}else {
			for(Student s : list) {
				System.out.printf("%d학년 %d반 %d번 %s / 주소 : %s\n", 
						s.getGrade(), s.getClassRoom(), s.getNumber(), s.getName(), s.getAddress());
			}
		}
	}
	
	
	/**학년별 조회
	 * */
	private void selectGrade() {
		System.out.println("\n--- 학년별 조회 ---\n");
		
		/*	조회할 학년을 입력하세요 : 3
		 * 	[조회한 학년 있을 경우]
		 * 	- 3학년 조회결과 -
		 * 	%d학년 %d반 %d번 %s
		 * 
		 * 	[조회한 학년 없을 경우]
		 * - %d학년 학생이 존재하지 않습니다 -
		 * */
		System.out.print("조회할 학년 : ");
		int stdGrade = sc.nextInt();
		
		List<Student> list = service.selectGrade(stdGrade);
		
		if(list.isEmpty()) { //리스트에 저장된 객체 없을 경우  true
			System.out.printf("%d학년 학생이 존재하지 않습니다.", stdGrade);
		}else {
			for(Student s : list) {
				System.out.printf("%d학년 %d반 %d번 %s\n", 
						s.getGrade(), s.getClassRoom(), s.getNumber(), s.getName());
			}
		}
		
	}
	
	/**성별 조회
	 * */
	private void selectGender() {
		
		
		/*	조회할 성별을 입력하세요(M/F) : m / M / f / F (대소문자 구분 x)
		 * 
		 * 	*****잘못 입력*****
		 * 	조회할 성별을 입력하세요(M/F) : 
		 *	[ M / F 만 입력해주세요]
		 *	정상 입력까지 무한루프
		 *
		 *	*****정상 입력*****
		 *	[여학생 목록]
		 *	%d학년 %d반 %d번 %s(M/F)\n
		 * */
		System.out.println("\n--- 성별 조회 ---\n");
		char stdGender;
		
		do {
			System.out.print("조회할 성별을 입력하세요(M/F) : ");
			stdGender = sc.next().toUpperCase().charAt(0);
			sc.nextLine();
			if(stdGender == 'M' || stdGender == 'F') {
				break;
			}
			
		}while(stdGender != 'M' || stdGender != 'F');
		
		List<Student> list = service.selectGender(stdGender);
		
		if(list.isEmpty()) { //리스트에 저장된 객체 없을 경우  true
			System.out.printf("없음");
		}else {
			if(stdGender == 'M') {
				System.out.println("[남학생 목록]");
			}else {
				System.out.println("[여학생 목록]");
			}
			for(Student s : list) {
				System.out.printf("%d학년 %d반 %d번 %s(%c)\n", 
						s.getGrade(), s.getClassRoom(), s.getNumber(), s.getName(), stdGender);
				}
		}
	}
	
	/**성적 순서 조회
	 * */
	private void sortScore() {
		System.out.println("\n--- 성적 순서 조회 ---\n");
		
		//성적순 정렬
		List<Student> studentList = service.sortScore();
		for(Student s : studentList) {
			System.out.println(s);
		}
	}
				

}
