//
//  SchoolModel.swift
//  NYCSchool
//
//  Created by apcfss on 10/02/24.
//

import Foundation

// MARK: - WelcomeElement

//MARK: - School Model ✨✨✨✨✨✨✨✨

struct SchoolModel: Codable {
    let dbn, schoolName, boro, overviewParagraph: String?
    let school10ThSeats, academicopportunities1, academicopportunities2, ellPrograms: String?
    let neighborhood, buildingCode, location, phoneNumber: String?
    let faxNumber, schoolEmail, website, subway: String?
    let bus, grades2018, finalgrades, totalStudents: String?
    let extracurricularActivities, schoolSports, attendanceRate, pctStuEnoughVariety: String?
    let pctStuSafe, schoolAccessibilityDescription, directions1, requirement11: String?
    let requirement21, requirement31, requirement41, requirement51: String?
    let offerRate1: String?
    let program1, code1, interest1, method1: String?
    let seats9Ge1, grade9Gefilledflag1, grade9Geapplicants1, seats9Swd1: String?
    let grade9Swdfilledflag1, grade9Swdapplicants1, seats101, admissionspriority11: String?
    let admissionspriority21, admissionspriority31, grade9Geapplicantsperseat1, grade9Swdapplicantsperseat1: String?
    let primaryAddressLine1, city, zip, stateCode: String?
    let latitude, longitude, communityBoard, councilDistrict: String?
    let censusTract, bin, bbl, nta: String?
    let borough: String?


    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case boro
        case overviewParagraph = "overview_paragraph"
        case school10ThSeats = "school_10th_seats"
        case academicopportunities1, academicopportunities2
        case ellPrograms = "ell_programs"
        case neighborhood
        case buildingCode = "building_code"
        case location
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case website, subway, bus, grades2018, finalgrades
        case totalStudents = "total_students"
        case extracurricularActivities = "extracurricular_activities"
        case schoolSports = "school_sports"
        case attendanceRate = "attendance_rate"
        case pctStuEnoughVariety = "pct_stu_enough_variety"
        case pctStuSafe = "pct_stu_safe"
        case schoolAccessibilityDescription = "school_accessibility_description"
        case directions1
        case requirement11 = "requirement1_1"
        case requirement21 = "requirement2_1"
        case requirement31 = "requirement3_1"
        case requirement41 = "requirement4_1"
        case requirement51 = "requirement5_1"
        case offerRate1 = "offer_rate1"
        case program1, code1, interest1, method1
        case seats9Ge1 = "seats9ge1"
        case grade9Gefilledflag1 = "grade9gefilledflag1"
        case grade9Geapplicants1 = "grade9geapplicants1"
        case seats9Swd1 = "seats9swd1"
        case grade9Swdfilledflag1 = "grade9swdfilledflag1"
        case grade9Swdapplicants1 = "grade9swdapplicants1"
        case seats101, admissionspriority11, admissionspriority21, admissionspriority31
        case grade9Geapplicantsperseat1 = "grade9geapplicantsperseat1"
        case grade9Swdapplicantsperseat1 = "grade9swdapplicantsperseat1"
        case primaryAddressLine1 = "primary_address_line_1"
        case city, zip
        case stateCode = "state_code"
        case latitude, longitude
        case communityBoard = "community_board"
        case councilDistrict = "council_district"
        case censusTract = "census_tract"
        case bin, bbl, nta, borough
    }
}

typealias Welcome = [SchoolModel]

