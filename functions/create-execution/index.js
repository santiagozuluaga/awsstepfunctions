const { SFNClient, StartExecutionCommand } = require("@aws-sdk/client-sfn");


exports.handler = async(event, context) => {
  try {

    const sfnClient = new SFNClient()

    const currentTime = new Date();
    const timeIn5Minutes = new Date(currentTime.getTime() + 5 * 60000);

    const response = await sfnClient.send(
      new StartExecutionCommand({
        stateMachineArn: process.env.STATE_MACHINE_ARN,
        input: JSON.stringify({
          ttl: timeIn5Minutes.toISOString()
        })
      }),
    );

    console.log(response);
  } catch (error) {
    throw error
  }
}