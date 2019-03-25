Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Olw-0007Jd-1N
 for ath10k@lists.infradead.org; Mon, 25 Mar 2019 12:32:20 +0000
Received: by mail-lj1-x22e.google.com with SMTP id v22so7623685lje.9
 for <ath10k@lists.infradead.org>; Mon, 25 Mar 2019 05:32:09 -0700 (PDT)
MIME-Version: 1.0
From: Mohammed Sha <mohammed.sha@vvdntech.in>
Date: Mon, 25 Mar 2019 18:01:30 +0530
Message-ID: <CAA6+HYVQON8etxqegZQO=PU3jtx_CvBwyTK5FkKtKFgT3V6rGA@mail.gmail.com>
Subject: QCA6174A Bluetooth HSP could not work
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi All,

Chip set: QCA6174A
Kernel : 4.14.62

I am attempting to implement hands-free telephony on my board, I
successfully connected my android phone to the board via bluetooth
module in phone and media audio sharing mode.
I was able to play media files via bluetooth by this. But when a call
connected the bluetooth speaker works properly, i.e. I can hear what
is said on the Mobile Phone, but audio is not transmitted from Board
to Mobile Phone is not heard ( I guess there is some error in getting
the data from mic or in transmitting data from bluetooth device). I
get the following log message keeps appearing many times as soon as a
call is initiated

"***Bluetooth: hci0 SCO packet for unknown connection handle 0***

***Bluetooth: hci0 sending frame failed (-27)***

***Bluetooth: hci0 sending frame failed (-27)***"

The microphone on the phone is also not functioning(after bluetooth
connection is established). Also in *hciconfig -a* it is found as
follows

hci0:   Type: Primary  Bus: USB
    BD Address: 00:0E:8E:76:00:55  ACL MTU: 1024:8  SCO MTU: 50:8
    UP RUNNING PSCAN
    RX bytes:810924 acl:982 sco:18885 events:670 errors:0
    **TX bytes:528349 acl:530 sco:10271 commands:108 errors:111**
    Features: 0xff 0xfe 0x8f 0xfe 0xd8 0x3f 0x5b 0x87
    Packet type: DM1 DM3 DM5 DH1 DH3 DH5 HV1 HV2 HV3
    Link policy: RSWITCH HOLD SNIFF
    Link mode: SLAVE ACCEPT
    Name: mydevice
    Class: 0x2c041c
    Service Classes: Rendering, Capturing, Audio
    Device Class: Audio/Video, Portable Audio
    HCI Version: 4.2 (0x8)  Revision: 0x0
    LMP Version: 4.2 (0x8)  Subversion: 0x25a
    Manufacturer: Qualcomm

How can I solve this and implement proper hands-free telephony?

The Bluetooth device is connected via USB interface, Below is the
device package configuration,
pulseaudio --version

pulseaudio 11.1
 bluetoothctl --version
bluetoothctl: 5.49

ofonod --version
1.22

The steps I followed to setup connection are as follows

    $ hciconfig hci0 up
    $ pactl list sources short
    $ pactl list sinks short
    $ bluetoothctl
    agent on
    scan on
    scan off
    pair <address>
    connect<address>

https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Bluetooth
In the above website section 5 they are mentioning to configure sco
audio using hcitool command, but i dont know the parameter to
configure qca6174a, Could someone help me to configure HSP/HFP profile
in QCA6174A chipset ?

-- 
Thanks & Regards
Mohammed Sha

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
