#include "qemu/osdep.h"
#include "hw/pci/pci.h"

#define TYPE_PCI_MYEDU_DEVICE "edu"

typedef struct MyEduState {
    /* PCIDevice is required */
    PCIDevice pdev;
    /* Optional */
    int id;
    int arr[9];
} MyEduState;

#define MY_EDU_PCI(obj)	OBJECT_CHECK(MyEduState, (obj), TYPE_PCI_MYEDU_DEVICE)

static void myedu_realize(PCIDevice *pci_dev, Error **errp){
    MyEduState *my_edu = MY_EDU_PCI(pci_dev);
    my_edu->id = 0x1222;
    my_edu->arr[0] = 2;

    printf("my edu loaded");
}

static void myedu_class_init(ObjectClass *class, void *data) {
    PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
    
    k->realize = myedu_realize;
	
    /* identify device */
    k->vendor_id = PCI_VENDOR_ID_QEMU; 
    k->device_id = 0x111b; 
    k->class_id = PCI_CLASS_OTHERS;

    k->revision = 0x0;
};

static void my_edu_register_types(void)
{
    static InterfaceInfo interfaces[] = {
        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
	{ },
    };
    static const TypeInfo myedu_info = {
        .name = TYPE_PCI_MYEDU_DEVICE,
        .parent = TYPE_PCI_DEVICE,
        .instance_size = sizeof(MyEduState),
	.class_init = myedu_class_init,
	.interfaces = interfaces,
    };
    type_register_static(&myedu_info);
}

type_init(my_edu_register_types);
