Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYzIL-0001g4-IR
 for ath10k@lists.infradead.org; Fri, 20 Mar 2015 15:57:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: unknown qca6164 model 0x0041
References: <201503191317.16541.arnd@arndb.de>
 <CA+BoTQn=Pi-hxmCV4TijgFr8W-26=s+juG+UQ1vhPXfUhi4ERQ@mail.gmail.com>
 <201503191431.38540.arnd@arndb.de>
Date: Fri, 20 Mar 2015 17:56:33 +0200
In-Reply-To: <201503191431.38540.arnd@arndb.de> (Arnd Bergmann's message of
 "Thu, 19 Mar 2015 14:31:38 +0100")
Message-ID: <877fubfyry.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Arnd Bergmann <arnd@arndb.de> writes:

> On Thursday 19 March 2015, Michal Kazior wrote:
>> On 19 March 2015 at 13:17, Arnd Bergmann <arnd@arndb.de> wrote:
>> > Hi,
>> >
>> > I just got a Lenovo Yoga 3 11" Laptop that came with a NFA345 wifi module that
>> > is allegedly using a qca6164 chip. The Windows driver calls it a 61x4 version 20
>> > device and the PCI ID is 168c:0041, which is different from the device ID
>> > that was just added to ath10k as QCA6174_2_1_DEVICE_ID (168c:003e).
>> >
>> > Does anyone have more information about this device and about how hard it would
>> > be to add support to the driver? Is there a chance that it might just work by
>> > adding the IDs or is it something rather different?
>> 
>> "version 20 device" strongly suggests this is a hw2.1 device.
>> Currently there's only ath10k firmware for hw3.0 chips available. You
>> can look through ath10k mailing list for discussions on qca6174 hw2.1
>> (qca6164 is basically 1x1 instead of 2x2 from what I understand).
>> 
>> If not for the firmware confusion adding support to the driver is
>> probably as trivial as just adding the new pci device id to the
>> supported list.
>
> Ok, I see. I still have Windows on the machine, so I can probably
> manage to extract the blob and also build a patched kernel once I'm
> able to install a working environment on the laptop.

I'm internally trying to sort out the firmware problem but that will
probably take some time. I or Michal will send mail once we have
something newsworthy.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
