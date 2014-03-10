import com.webapp.*
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (!Role.count()) {
            new Role(authority: 'ROLE_USER').save(flush:true, failOnError:true)
            new Role(authority: 'ROLE_ADMIN').save(flush:true, failOnError:true)
        }
        
        if (!User.count()) {
            def roleUser = Role.findByAuthority('ROLE_USER')
            def roleAdmin = Role.findByAuthority('ROLE_ADMIN')
            assert roleUser
            assert roleAdmin
            
            def users = [
                    admin: ['Admin Admin', 'admin@admin.com', 'Add 1'],
                    user1: ['User One', 'user1@asdf.com', 'Add 1'],
                    user2: ['User Two', 'user2@asdf.com', 'Add 1']
                    ]
        
            users.each { uname, data ->
                def user = new User(password:'admin', fullName:data[0], email:data[1],
                        dateOfBirth:Date.parse("yyyy-MM-dd'T'HH:mm:ssz", "1935-07-17T00:00:00EST"),
                        address:new Address(
                            address1: '123 Street Rd.',
                            address2: data[2],
                            city: 'Stamford',
                            state: 'CT',
                            postalCode: '06905'
                        ))
                user.save(flush:true, failOnError:true)
                UserRole.create user, (uname == 'admin' ? roleAdmin : roleUser), true
            }
        
        }
    
        if (!Organization.count()) {
            def admin = User.findByEmail('admin@admin.com')
            assert admin

            def org1 = new Organization(name:"Number one Organization")
            org1.save(failOnError:true)

            new OrganizationHoliday(organization: org1, name:"Martin Luther King Jr Day", starttime: Date.parse("yyyy-MM-dd'T'HH:mm:ssz", "2014-01-20T00:00:00EST"), endtime: Date.parse("yyyy-MM-dd'T'HH:mm:ssz", "2014-01-20T23:59:59EST")).save(failOnError:true)
            new OrganizationHoliday(organization: org1, name:"President's Day", starttime: Date.parse("yyyy-MM-dd'T'HH:mm:ssz", "2014-02-17T00:00:00EST"), endtime: Date.parse("yyyy-MM-dd'T'HH:mm:ssz", "2014-02-17T23:59:59EST")).save(failOnError:true)
        }
    
    }
    
    def destroy = {
    }
}
