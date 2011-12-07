# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Job.destroy_all
Job.create(company_id: '1', jobtitle: 'Lead dev', jobdescription: "write sweet code", postinglink: 'www.codemaster.com', dateofposting: '11/11/11', salary: '100', careerfield: 'technology', dateappliedto: '12/12/11')
Job.create(company_id: '2', jobtitle: 'Trader', jobdescription: "make mad money", postinglink: 'www.trademaster.com', dateofposting: '10/15/11', salary: '10', careerfield: 'finance', dateappliedto: '12/1/11')

Contact.destroy_all
Contact.create(firstname: 'Tom', lastname: 'Cullen', jobtitle: 'head master', email: 't@t.com', twitter: 'tommy', linkedin: 'tomyc', facebook: 'tomc', mainphone: '12345', workphone: '123456', faxnumber: '123456', meetups: '8th light', meetup_url: 'wwww.meatdown.com', otherinfo: 'this is cool')
Contact.create(firstname: 'goeff', lastname: 'Coolio', jobtitle: 'Master Debator', email: 'g@t.com', twitter: 'geoffy', linkedin: 'geoffm', facebook: 'mass', mainphone: '12345', workphone: '123456', faxnumber: '123456', meetups: '9th light', meetup_url: 'wwww.themeatdown.com', otherinfo: 'this is dumb')

Company.destroy_all
Company.create(companyname: 'snarfs', website: 'www.snarfs.com', industry: 'sandwich craftsmanship', companynotes: 'get extra meat')
Company.create(companyname: 'motel bar', website: 'motel.com', industry: 'bar', companynotes: 'this place sux')

Contactcompanyjoin.destroy_all
Contactcompanyjoin.create(company_id: '1', contact_id: '1')
Contactcompanyjoin.create(company_id: '2', contact_id: '2')

Jobconnection.destroy_all
Jobconnection.create(job_id: '1', contact_id: '1')
Jobconnection.create(job_id: '2', contact_id: '2')


