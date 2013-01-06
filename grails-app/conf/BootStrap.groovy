import com.webapp.*
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        
        if (!Person.count() && Environment.current != Environment.TEST) {
            new Person(firstName:"Ron", lastName:"Burgundy", email:"ronb@kvwn.net", dateOfBirth:Date.parse("yyyy-MM-dd'T'HH:mm:ssz", "1935-07-17T00:00:00EST"),
                    address:new Address(address1:'123 Street Rd.', address2:'Apt. 1A', city:'San Diego', state: 'CA', postalCode:'92101')).save(flush:true, failOnError:true)
            new Person(firstName:"Brian", lastName:"Fantana", email:"brianf@kvwn.net", dateOfBirth:Date.parse("yyyy-MM-dd'T'HH:mm:ssz", "1935-07-17T00:00:00EST"),
                    address:new Address(address1:'123 Street Rd.', address2:'Apt. 1B', city:'San Diego', state: 'CA', postalCode:'92101')).save(flush:true, failOnError:true)
            new Person(firstName:"Brick", lastName:"Tamland", email:"brickt@kvwn.net", dateOfBirth:Date.parse("yyyy-MM-dd'T'HH:mm:ssz", "1935-07-17T00:00:00EST"),
                    address:new Address(address1:'123 Street Rd.', address2:'Apt. 1C', city:'San Diego', state: 'CA', postalCode:'92101')).save(flush:true, failOnError:true)
        }
                
        if (!Role.count()) {
            def roleUser = new Role(authority: 'ROLE_USER').save(flush:true, failOnError:true)
            
            if (!User.count() && Environment.current != Environment.TEST) {
                def users = [
                        ronb: ['Ron Burgundy', 'ronb@kvwn.net', 'Apt. 1A'],
                        brinaf: ['Brian Fantana', 'brinaf@kvwn.net', 'Apt. 1B'],
                        brickt: ['Brick Tamland', 'brickt@kvwn.net', 'Apt. 1C']
                        ]
                
                users.each { uname, data ->
                    def user = new User(username:uname, password:'asdf', fullName:data[0], email:data[1], dateOfBirth:Date.parse("yyyy-MM-dd'T'HH:mm:ssz", "1935-07-17T00:00:00EST"),
                            address:new Address(
                                address1: '123 Street Rd.',
                                address2: data[2],
                                city: 'San Diego',
                                state: 'CA',
                                postalCode: '92101'
                            ))
                    user.save(flush:true, failOnError:true)
                    UserRole.create user, roleUser, true
                }
                
            }
        }
        
    }
    
    def destroy = {
    }
}
