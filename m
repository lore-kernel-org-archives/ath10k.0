Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b8WRi-0003fo-AH
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 17:30:14 +0000
Subject: Re: Bug 119151 - [regression] ath10k no longer authenitcates and
 freezes system
References: <8760trzoiw.fsf@kamboji.qca.qualcomm.com>
 <871t4fzn1x.fsf@kamboji.qca.qualcomm.com> <57504F05.3040200@candelatech.com>
 <1464887026467.72937@qti.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <57506BA1.2090303@candelatech.com>
Date: Thu, 2 Jun 2016 10:23:45 -0700
MIME-Version: 1.0
In-Reply-To: <1464887026467.72937@qti.qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: "mike@fireburn.co.uk" <mike@fireburn.co.uk>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On 06/02/2016 10:03 AM, Manoharan, Rajkumar wrote:
> On Thursday, June 2, 2016 8:51 PM, Ben Greear <greearb@candelatech.com> wrote:
>> On 06/02/2016 07:24 AM, Valo, Kalle wrote:
>>> Kalle Valo <kvalo@qca.qualcomm.com> writes:
>>>
>>>> there's a regression in ath10k:
>>>>
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=119151
>>>>
>>>> Reporter bisected it to this:
>>>>
>>>> 5c86d97bcc1d42ce7f75685a61be4dad34ee8183 is the first bad commit
>>>> commit 5c86d97bcc1d42ce7f75685a61be4dad34ee8183
>>>> Author: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
>>>> Date:   Tue Mar 22 17:22:19 2016 +0530
>>>>
>>>> ath10k: combine txrx and replenish task
>>>>
>>>> Since tx completion and rx indication processing are moved out
>>>> of txrx tasklet and rx ring lock contention also removed from txrx
>>>> for rx_ind messages, it would be efficient to combine both replenish
>>>> and txrx tasks. Refill threshold is adjusted for both AP135 and AP148
>>>> (low and high end systems). With this adjustment in AP135, TCP DL is
>>>> improved from 603 Mbps to 620 Mbps and UDP DL is improved from 758 Mbps
>>>> to 803 Mbps. Also no watchdog are observed on UDP BiDi.
>>>>
>>>> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
>>>> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>>>
>>> Adding Mike, the bug reporter.
>>
> Mike,
>
> Sorry for the regression. Since the patch combines both txrx and replenish tasklet,
> it is validated in low end embedded devices like AP135 (single core 720 MHz MIPS processor).
>
> It seems yours is octa core processor.  So CPU is not bottleneck here. Need your help to fix this issue asap.
> Can you please try reducing rx refill threshold as below.
>
> diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
> index 2aa407160859..d35d3d48ae6c 100644
> --- a/drivers/net/wireless/ath/ath10k/htt.h
> +++ b/drivers/net/wireless/ath/ath10k/htt.h
> @@ -1734,7 +1734,7 @@ struct htt_rx_desc {
>
>   /* Refill a bunch of RX buffers for each refill round so that FW/HW can handle
>    * aggregated traffic more nicely. */
> -#define ATH10K_HTT_MAX_NUM_REFILL 100
> +#define ATH10K_HTT_MAX_NUM_REFILL 16
>
>  From your log attachment from bug report, I found few timed out messages.
> May 30 21:09:26 axion kernel: wlan0: deauthenticating from a0:63:91:a7:3c:9f by local choice (Reason: 3=DEAUTH_LEAVING)
> May 30 21:09:32 axion kernel: ath10k_pci 0000:3c:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0
> May 30 21:09:35 axion kernel: ath10k_pci 0000:3c:00.0: failed to delete peer a0:63:91:a7:3c:9f for vdev 0: -110
> May 30 21:09:35 axion kernel: ath10k_pci 0000:3c:00.0: found sta peer a0:63:91:a7:3c:9f entry on vdev 0 after it was supposed
>
> Try disabling pci power save for qca6174 as below.
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index 852f2c18cd11..5e3ba37a8c6a 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -2979,7 +2979,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
>          case QCA6164_2_1_DEVICE_ID:
>          case QCA6174_2_1_DEVICE_ID:
>                  hw_rev = ATH10K_HW_QCA6174;
> -               pci_ps = true;
> +               pci_ps = false;
>                  pci_soft_reset = ath10k_pci_warm_reset;
>                  pci_hard_reset = ath10k_pci_qca6174_chip_reset;
>
>>
>> I found a lot of problems with this code as well, and the 5 patches
>> starting from the URL below fixed the issues for me.
>>
> Ben,
>
> Can you please explain the sort of issues you have observed with this change?

I imported a bunch of upstream patches at once, so not sure exactly what commit
caused it.  And, this was about 2 months ago...  Upon review, I'm not sure I even have
the patch this particular bug was bisected to, so maybe that is some other issue.

But, the problems I saw were deadlocks and memory corruption.  A lot of it was
because I was debugging new firmware at the time and so peer creation was failing
sometimes, and things like that.  The error handling in ath10k for this was
faulty and racy and such.  We have not seen any performance regressions,
but we mostly run on very powerful CPUs.

Please take a look at those 5 patches.  A good review would be much appreciated,
and by reading them you will better be able to see the problems I was hitting
and trying to fix.

In case you want to look at the full context of those patches, you can find
them here (around 24 patches down from the top...)

http://dmz2.candelatech.com/?p=linux-4.4.dev.y/.git;a=summary

For now, I am sticking with 4.4 + what I pulled in, but will rebase against upstream someday
soon-ish and then we can start testing it all over again :)

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
