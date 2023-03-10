package edu.kh.polymorphism.ex1.dto;

public class LightCar extends Car {
	
	private double discountOffer;	//할인 혜택

	public LightCar() {
		super();
	}

	public LightCar(int wheel, int seat, String fuel, double discountOffer) {
		super(wheel, seat, fuel);
		this.discountOffer = discountOffer;
	}

	public double getDiscountOffer() {
		return discountOffer;
	}

	public void setDiscountOffer(double discountOffer) {
		this.discountOffer = discountOffer;
	}
	
	//Car.toString() 오버라이딩
	@Override
	public String toString() {
		
		return super.toString() + " / 할인율 : " + discountOffer * 100 + "%";
	}
	
	public void print() {
		System.out.println("고속도로 , 주차장, 세금 할인 혜택을 받을 수 있다.");
	}
	
	
	
	
	
	
	
	
}
