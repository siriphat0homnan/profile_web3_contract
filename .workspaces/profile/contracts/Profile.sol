// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Profile {

    struct Bio {
        Information information;
        Contract privateContract;
        Skill skill;
        Education[] education;
        CertificateAndAward certificateAndAward;
        CompanyExperience[] companyExperience;
        FreelanceExperience[] freelanceExperience;
    }
    mapping (address => Bio) public  profile;

    struct Information {
        string aboutMe;
        string position;
        address userAddress;
        string firstName;
        string middleName;
        string lastName;
        string profileImage;
        uint256 createDate;
    }

    struct Contract {
        string aboutMe;
        string email;
        string phone;
        string github;
        string gitlab;
        string linkedin;
    }

    struct Skill {
        string[] programmingLanguages;
        string[] framework;
        string[] databaseAndOther;
    }

    struct CompanyExperience {
        string companyName;
        string position;
        string startDate;
        string endDate;
        string[] project;
    }

    struct FreelanceExperience {
        string projectName;
        string Detail;
    }

    struct Education {
        string startDate;
        string endDate;
        string university;
        string major;
        string finalProject;
    }

    struct CertificateAndAward {
        string[] certificate;
        string[] award;
    }

    function myBalance() public view returns(uint256){
        return address(msg.sender).balance;
    }
    
    function createInformation(string memory firstName, string memory middleName, string memory lastName,  string memory profileImage, string memory aboutMe, string memory position) public {
        profile[msg.sender].information.firstName = firstName;
        profile[msg.sender].information.middleName = middleName;
        profile[msg.sender].information.lastName = lastName;
        profile[msg.sender].information.profileImage = profileImage;
        profile[msg.sender].information.aboutMe = aboutMe;
        profile[msg.sender].information.position = position;
        profile[msg.sender].information.userAddress = msg.sender; 
        profile[msg.sender].information.createDate = block.timestamp;
    }

    function createContract(string memory email, string memory phone, string memory github, string memory gitlab, string memory linkedin) public {
        delete profile[msg.sender].privateContract;
        profile[msg.sender].privateContract.email = email;
        profile[msg.sender].privateContract.phone = phone;
        profile[msg.sender].privateContract.github = github;
        profile[msg.sender].privateContract.gitlab = gitlab;
        profile[msg.sender].privateContract.linkedin = linkedin;
    }

    function createSkill(string[] memory programmingLanguages, string[] memory framework, string[] memory databaseAndOther) public {
        delete profile[msg.sender].skill;
        profile[msg.sender].skill.programmingLanguages = programmingLanguages;
        profile[msg.sender].skill.framework = framework;
        profile[msg.sender].skill.databaseAndOther = databaseAndOther;
    }

    function createEducation(string memory startDate, string memory endDate, string memory university, string memory major, string memory finalProject) public {
        Education memory _education;
        _education.startDate = startDate;
        _education.endDate = endDate;
        _education.university = university;
        _education.major = major;
        _education.finalProject = finalProject;
        profile[msg.sender].education.push(_education);
    }
 
    function getEducation(uint index) public view returns(string memory, string memory, string memory, string memory, string memory) {
        return (profile[msg.sender].education[index].startDate, profile[msg.sender].education[index].endDate, profile[msg.sender].education[index].university, profile[msg.sender].education[index].major, profile[msg.sender].education[index].finalProject);
    }

    function getEducationCount() public view returns (uint) {
        return profile[msg.sender].education.length;
    }

    function createAward(string[] memory award, string[] memory certificate) public {
        profile[msg.sender].certificateAndAward.award = award;
        profile[msg.sender].certificateAndAward.certificate = certificate;
    }

    function createFreelanceExperience(string memory projectName, string memory Detail) public {
        FreelanceExperience memory _freelanceExperience;
        _freelanceExperience.projectName = projectName;
        _freelanceExperience.Detail = Detail;
        profile[msg.sender].freelanceExperience.push(_freelanceExperience);
    }

    function getFreelanceExperience(uint index) public view returns(string memory, string memory) {
        return (profile[msg.sender].freelanceExperience[index].projectName, profile[msg.sender].freelanceExperience[index].Detail);
    }

    function getFreelanceExperienceCount() public view returns (uint) {
        return profile[msg.sender].freelanceExperience.length;
    }

    function createCompanyExperience(string memory companyName, string memory position, string memory startDate, string memory endDate, string[] memory project) public {
        CompanyExperience memory _companyExperience;
        _companyExperience.companyName = companyName;
        _companyExperience.position = position;
        _companyExperience.startDate = startDate;
        _companyExperience.endDate = endDate;
        _companyExperience.project = project;
        profile[msg.sender].companyExperience.push(_companyExperience);
    }

    function getCompanyExperience(uint index) public view returns(string memory, string memory, string memory, string memory, string[] memory) {
        return (profile[msg.sender].companyExperience[index].companyName, profile[msg.sender].companyExperience[index].position, profile[msg.sender].companyExperience[index].startDate, profile[msg.sender].companyExperience[index].endDate, profile[msg.sender].companyExperience[index].project);
    }

    function getCompanyExperienceCount() public view returns (uint) {
        return profile[msg.sender].companyExperience.length;
    }

    function delAllEducation() external  {
        delete profile[msg.sender].education;
    }

    function delInformaion() external  {
        delete profile[msg.sender].information;
    }

    function delProfile() external {
        delete profile[msg.sender];
    }

    function delCertificateAndAward() external {
        delete profile[msg.sender].certificateAndAward;
    }

    function delFreelanceExperience() external {
        delete profile[msg.sender].freelanceExperience;
    }

    function delCompanyExperience() external {
        delete profile[msg.sender].companyExperience;
    }
}