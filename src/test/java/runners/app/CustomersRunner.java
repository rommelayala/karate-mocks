package runners.app;

import com.intuit.karate.junit5.Karate;

class CustomersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:features/customers.feature").relativeTo(getClass());
    }    

}
