Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dsx5c-0006Oc-NV
 for ath10k@lists.infradead.org; Fri, 15 Sep 2017 20:19:54 +0000
Subject: Re: Failed to wake device (9984)
References: <c88e48ec-fddc-864e-0ed2-d88e9cc07fb5@candelatech.com>
 <CAJ-VmoknefqtxZCMc+PETo7Y3-HOcn0H3ySZqVWDTwMirACfcg@mail.gmail.com>
 <cfd0f2d6-5383-1956-5d32-771a1f329f1f@candelatech.com>
 <CAJ-Vmom-DUM7R9sGL5SVeMysm-tkRkNrFVXkSfx4kJ+W4yzr1w@mail.gmail.com>
 <9068d06f-9245-1eb9-cac3-819c6ed6d471@candelatech.com>
 <CAJ-VmokDxfHbZ0VhdiuMcT-Q7hAcStn-j4z9079EqiyjRMXh1g@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <10079cdc-8e64-5f9c-23df-118003ef9f11@candelatech.com>
Date: Fri, 15 Sep 2017 13:19:31 -0700
MIME-Version: 1.0
In-Reply-To: <CAJ-VmokDxfHbZ0VhdiuMcT-Q7hAcStn-j4z9079EqiyjRMXh1g@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>
Cc: ath10k <ath10k@lists.infradead.org>

On 09/15/2017 12:38 PM, Adrian Chadd wrote:
> On 15 September 2017 at 09:59, Ben Greear <greearb@candelatech.com> wrote:
>> On 09/14/2017 07:33 PM, Adrian Chadd wrote:
>>>
>>> On 14 September 2017 at 17:13, Ben Greear <greearb@candelatech.com> wrote:
>>>
>>>>>
>>>>> There were always weird cold reset races that necessitated a PCI bus
>>>>> reset of the device. :( can you even see the device? do any of the registers
>>>>> work?
>>>>
>>>>
>>>>
>>>> Can the cold reset be done on generic x86-64 hardware?
>>>
>>>
>>> I'll have to go check. You /should/ be able to. Are there are power
>>> and reset files in /sys/bus/pci for those devices?
>>>
>>>>
>>>> And, it shows up enough that the system probes it, at least.  I guess no
>>>> infrastructure to speak of set up for this thing, so not sure how to
>>>> probe any registers.
>>>
>>>
>>> Well, that could be cached BAR information. There are some cold / warm
>>> reset registers in the RTC block that are used during initial wakeup;
>>> print what they're saying to see if it's coming back 0xfffffff or
>>> 0xdeadc0de or something?
>>
>>
>> One thing I notice, if I simply:  rmmod ath10k_pci ath10k_core; modprobe
>> ath10k_pci
>> then it recovered (1 of 1 so far).
>
> See if that's reliable. For QCA9880 I know it needed a full
> reacharound sometimes (ie, the reference driver has hooks to reach
> back into the PCIe nexus to toggle reset.)

It is not that reliable.  I'm now trying a hack to re-probe the bus up
to 3 times if we fail....hoping maybe that will help.

We just hit a case where the first 2 times failed, but it booted on
the third.

My patch looks like this:

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index e0a7b338..711b3f0 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3492,8 +3492,8 @@ static const struct ath10k_bus_ops ath10k_pci_bus_ops = {
         .get_num_banks  = ath10k_pci_get_num_banks,
  };

-static int ath10k_pci_probe(struct pci_dev *pdev,
-                           const struct pci_device_id *pci_dev)
+static int __ath10k_pci_probe(struct pci_dev *pdev,
+                             const struct pci_device_id *pci_dev)
  {
         int ret = 0;
         struct ath10k *ar;
@@ -3668,6 +3668,22 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
         return ret;
  }

+static int ath10k_pci_probe(struct pci_dev *pdev,
+                           const struct pci_device_id *pci_dev)
+{
+       int cnt = 0;
+       int rv;
+       do {
+               rv = __ath10k_pci_probe(pdev, pci_dev);
+               if (rv == 0)
+                       return rv;
+               pr_err("ath10k: failed to probe PCI : %d, retry-count: %d\n", rv, cnt);
+               udelay(10000); /* let the ath10k firmware gerbil take a small break */
+       } while (cnt++ < 3);
+       return rv;
+}
+
+
  static void ath10k_pci_remove(struct pci_dev *pdev)
  {
         struct ath10k *ar = pci_get_drvdata(pdev);


Thanks,
Ben


>
>> We'll see if that is a reliable way to recover from this problem.  And, will
>> see if we
>> can also find a nicer way to go about it...maybe there is just a timer that
>> is not long
>> enough somewhere?
>
> It's possible. I am just always wary about their host glue in the chip
> :-) If reloading the driver helps then great. But all that /should/ be
> dong is a cold reset / wakeup..
>
>
>
> -adrian
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
