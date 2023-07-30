import UIKit

//Thread
//Operation
//GCD

//MARK: --  Quality of service (QoS)

//MARK: -- C
var pthread = pthread_t(bitPattern: 0)
var attribute = pthread_attr_t()
pthread_attr_init(&attribute) // address of attribute
pthread_attr_set_qos_class_np(&attribute, QOS_CLASS_USER_INITIATED, 0) //create priority
pthread_create(&pthread, &attribute, { pointer in
    print("test")
    pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0)
    return nil
}, nil)

//MARK: -- Objective-C
let nsThread = Thread {
    print("test")
    print(qos_class_self())
}

nsThread.qualityOfService = .userInteractive // priority, higher - faster and more important
nsThread.start()

print(qos_class_main())
