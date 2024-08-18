//import java.io.IOException;
//import java.util.concurrent.CopyOnWriteArrayList;
//
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
//
//@RestController
//public class SseController {
//
//    private final CopyOnWriteArrayList<SseEmitter> emitters = new CopyOnWriteArrayList<>();
//
//    @GetMapping("/subscribe")
//    public SseEmitter subscribe() {
//        SseEmitter emitter = new SseEmitter();
//
//        this.emitters.add(emitter);
//
//        emitter.onCompletion(() -> this.emitters.remove(emitter));
//        emitter.onTimeout(() -> this.emitters.remove(emitter));
//
//        return emitter;
//    }
//
//    @GetMapping("/alarm")
//    public void triggerAlarm(String message) {
//        sendAlarmToAllClients(message);
//    }
//
//    private void sendAlarmToAllClients(String message) {
//        for (SseEmitter emitter : emitters) {
//            try {
//                emitter.send(SseEmitter.event()
//                        .name("alarm")
//                        .data(message));
//            } catch (IOException e) {
//                emitters.remove(emitter);
//            }
//        }
//    }
//}