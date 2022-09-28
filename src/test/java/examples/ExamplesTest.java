package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

import javax.sound.midi.SysexMessage;

class ExamplesTest {

    @Test
    void testParallel() {

        Results results = Runner.path("classpath:examples")
                .outputCucumberJson(true)
                .outputHtmlReport(true)
                .reportDir(System.getProperty("report.dir"))
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
        System.out.println("Report path : " + System.getProperty("report.dir"));
    }

}
