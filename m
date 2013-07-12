Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uxeht-0002CK-Ma
 for ath10k@lists.infradead.org; Fri, 12 Jul 2013 14:52:26 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [ath9k-devel] [PATCH] ath10k:  Fix crash when using v1 hardware.
References: <1372804925-1701-1-git-send-email-greearb@candelatech.com>
 <87y59d5tgu.fsf@kamboji.qca.qualcomm.com>
 <51DEC9A7.2080207@candelatech.com>
Date: Fri, 12 Jul 2013 17:51:54 +0300
In-Reply-To: <51DEC9A7.2080207@candelatech.com> (Ben Greear's message of "Thu, 
 11 Jul 2013 08:05:11 -0700")
Message-ID: <87d2qn4yr9.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 07/11/2013 02:36 AM, Kalle Valo wrote:
>> greearb@candelatech.com writes:
>>
>>> +	/* On v1 hardware at least, setup can fail, causing ce_id_state to
>>> +	 * be cleaned up, but this method is still called a few times.  Check
>>> +	 * for NULL here so we don't crash.  Probably a better fix is to stop
>>> +	 * the ath10k_pci_ce_tasklet sooner.
>>> +	 */
>>> +	if (WARN_ONCE(!ce_state, "ce_id_to_state[%i] is NULL\n", ce_id))
>>> +		return;
>>> +
>>> +	ctrl_addr = ce_state->ctrl_addr;
>>> +
>>
>> The tests you add look like workarounds. I would prefer to try fix these
>> by going to the source of the problem. Maybe we should add
>> ath10k_pci_wake() and ath10k_do_pci_wake()?

Doh, dropped an essential word from a sentence, again. That's what I get
when trying to do multiple things at the same time.

What I was trying to say: Maybe we should add proper error hanling to
ath10k_pci_wake() and ath10k_do_pci_wake() and that way avoid this?

> These are work-arounds, but you should not let a bad piece of
> hardware/firmware crash the entire OS just because you don't want to
> do sanity checking on the values you get from the firmware. Perhaps
> there is a better fix for the code above, but the warning splat should
> still provide incentive to get it right, while not crashing the OS in
> the meantime.

Sure, the driver should not crash if HW is not functioning correctly.
I'm just saying that adding odd checks at random places is not the
"kernel way" to do things, only GTK people do that ;)

I was thinking that the proper way is to check that wakeup succeeds and
not enable interrupts or something like that.

>> Can you enable few debug logs, like ATH10K_DBG_PCI, and post them? That
>> would give more hint there things are going wrong.
>
> Yes, I can do that.

Thanks.

Oh, did you mention something that ath10k detect the device as hw2.0?
Maybe the PCI ids are wrong? Then you could also force the same
workaround for hw2.0 as hw1.0 has:

--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2145,10 +2145,8 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 
        switch (pci_dev->device) {
        case QCA988X_1_0_DEVICE_ID:
-               set_bit(ATH10K_PCI_FEATURE_HW_1_0_WARKAROUND, ar_pci->features);
-               break;
        case QCA988X_2_0_DEVICE_ID:
-               set_bit(ATH10K_PCI_FEATURE_MSI_X, ar_pci->features);
+               set_bit(ATH10K_PCI_FEATURE_HW_1_0_WARKAROUND, ar_pci->features);
                break;
        default:
                ret = -ENODEV;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
