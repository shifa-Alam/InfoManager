import { Component, Inject, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, FormControl, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Observable, ReplaySubject } from 'rxjs';
import { City } from '../Models/city';
import { Country } from '../Models/country';
import { Member } from '../Models/member';
import { MemberSkill } from '../Models/memberSkill';
import { Skill } from '../Models/skill';
import { MemberService } from '../services/member.service';
export interface memberFormGroup {
  name: FormControl<string>;
  countryId: FormControl<number>;
  cityId: FormControl<number>;
  dateOfBirth?: FormControl<any>;//? makes controls as optional
}
@Component({
  selector: 'app-member-add',
  templateUrl: './member-add.component.html',
  styleUrls: ['./member-add.component.css']
})
export class MemberAddComponent implements OnInit {
  fileToUpload: File | null = null;
  member: Member = new Member();
  memberForm!: FormGroup<memberFormGroup>;
  isLoading: boolean = false;
  countries: Country[] = [];
  cities: City[] = [];
  skills: Skill[] = [];
  dummySkill: Skill[] = [];
  selectedFile: any;
  constructor(
    public service: MemberService,
    public fb: FormBuilder,
    public dialogRef: MatDialogRef<MemberAddComponent>,
    @Inject(MAT_DIALOG_DATA) public data: {
      member: Member
    }
  ) {
    Object.assign(this.member, data.member);
  }
  ngOnInit(): void {
    this.getCountries();
    this.getCities();
    this.getSkills();
    this.dialogRef.updateSize('75%')
    this.createMemberForm();
    this.setValue();
  }
  onFileSelected(event: any) {
    this.selectedFile = event.target.files[0];
    this.member.resume= window.URL.createObjectURL(this.selectedFile) as string;
    // this.convertFile(event.target.files[0]).subscribe(base64 => {
    //   this.member.resume = base64;
    // });
  }
  // convertFile(file : File) : Observable<string> {
  //   const result = new ReplaySubject<string>(1);
  //   const reader = new FileReader();
  //   reader.readAsBinaryString(file);
  //   reader.onload = (event) => result.next(btoa(event.target.result.toString()));
  //   return result;
  // }
  createMemberForm() {
    this.memberForm = new FormGroup<memberFormGroup>({
      name: new FormControl<string>('', { nonNullable: true, validators: [Validators.required] }),
      countryId: new FormControl<number>(0, { nonNullable: true, validators: [Validators.required] }),
      cityId: new FormControl<number>(0, { nonNullable: true, validators: [Validators.required] }),
      dateOfBirth: new FormControl<any>('')
    });
  }
  setValue() {
    if (this.member) {
      this.memberForm.patchValue({
        name: this.member.name,
        cityId: this.member.cityId,
        countryId: this.member.countryId,
        dateOfBirth: this.member.dateOfBirth
      })
    }
  }
  handleFileInput() {
    // this.fileToUpload = files.item(0);
    // this.member.resume=this.fileToUpload?.toString();
  }
  cancel() {
    this.dialogRef.close();
  }
  submit() {
    console.log(this.memberForm);
    this.member.name = this.memberForm.value.name as string;
    this.member.cityId = this.memberForm.value.cityId as number;
    this.member.countryId = this.memberForm.value.countryId as number;
    this.member.dateOfBirth = this.memberForm.value.dateOfBirth as any;


    if (this.member.id) {
      this.service.updateMember(this.member).subscribe(result => {
        this.dialogRef.close();
      },
        error => console.error(error));

    } else {

      this.service.saveMember(this.member).subscribe(result => {
        this.dialogRef.close();
      },
        error => console.error(error));


    }

  }


  getCountries() {
    this.isLoading = true;
    this.service.getCountries().subscribe(result => {
      this.countries = result;
      this.isLoading = false;
    },
      error => {
        console.error(error);
        this.isLoading = false;
      }
    );
  }
  getSkills() {
    this.isLoading = true;
    this.service.getSkills().subscribe(result => {
      this.skills = result;
      this.memberSkillUpdate();
      this.isLoading = false;
    },
      error => {
        console.error(error);
        this.isLoading = false;
      }
    );
  }

  memberSkillUpdate() {
    if (this.member.id == 0) {
      this.skills.forEach(element => {
        var memberSkill: MemberSkill = new MemberSkill();
        memberSkill.skillId = element.id;
        memberSkill.skillName = element.name;
        memberSkill.isSelect = false;
        this.member.memberSkills.push(memberSkill);
      });
    } else {
      this.skills.forEach(e => {
        if (this.member.memberSkills.find(x => (x.skillId == e.id))) {

        } else {
          this.dummySkill.push(e);
        }
        this.dummySkill.forEach(element => {
          var memberSkill = new MemberSkill();
          memberSkill.skillId = element.id;
          memberSkill.skillName = element.name;
          memberSkill.isSelect = false;
          this.member.memberSkills.push(memberSkill);
        });
      });


    }

  }

  getCities() {
    this.isLoading = true;
    this.service.getCities().subscribe(result => {
      this.cities = result;
      this.isLoading = false;
    },
      error => {
        console.error(error);
        this.isLoading = false;
      }
    );
  }
}

