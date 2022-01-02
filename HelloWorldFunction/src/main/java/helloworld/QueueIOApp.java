package helloworld;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.SQSEvent;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import software.amazon.awssdk.services.sns.SnsClient;
import software.amazon.awssdk.services.sns.model.PublishRequest;

import java.util.ArrayList;
import java.util.List;

public class QueueIOApp implements RequestHandler<SQSEvent, String> {
    private static SnsClient sns;
    private static Gson gson;

    @Override
    public String handleRequest(SQSEvent input, Context context) {
        String topic_arn = System.getenv("SNS_TOPIC_ARN");
        gson = gson == null ? new GsonBuilder().setPrettyPrinting().create() : gson;
        sns = sns == null ? SnsClient.builder().build() : sns;

        List<String> messages = new ArrayList<>();
        for(SQSEvent.SQSMessage msg : input.getRecords()){
            String body = msg.getBody();
            System.out.println(String.format("Received SQS message: %s", body));
            messages.add(body);

            PublishRequest publication = PublishRequest.builder()
                .topicArn(topic_arn)
                .subject("subject")
                .message(body)
                .build();
            sns.publish(publication);
            System.out.println(String.format("Published message to: %s", topic_arn));
        }

        String json = gson.toJson(messages);
        return String.format("Parsed %d messages.", messages.size());
    }
}
