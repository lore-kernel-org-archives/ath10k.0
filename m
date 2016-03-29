Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1akvtQ-0006ae-8P
 for ath10k@lists.infradead.org; Tue, 29 Mar 2016 15:49:21 +0000
Subject: Re: hacked 4.4.6+, 10.4.3 firmware, Running out of ring-index for
 pipe-id 3 (WMI).
References: <56F97F91.10007@candelatech.com>
 <CA+BoTQnzFiS2HpUweNzwhiUD3Gaa40pZq+z8GhHLn5STq1OgHQ@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56FAA3D5.3070409@candelatech.com>
Date: Tue, 29 Mar 2016 08:48:37 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnzFiS2HpUweNzwhiUD3Gaa40pZq+z8GhHLn5STq1OgHQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 03/29/2016 01:05 AM, Michal Kazior wrote:
> On 28 March 2016 at 21:01, Ben Greear <greearb@candelatech.com> wrote:
>> I'm seeing the ring-full messages below when running 35 stations on
>> modified 10.4.3 firmware.  I also have serial console logging enabled, so
>> things are running a bit slow...this seems to exacerbate the issue.
>>
>> [   91.108923] ath10k_pci 0000:05:00.0: htc failed hif-tx-sq: -105 eid: 2
>> credits: 1 ep->tx_credits: 1  credit-flow-enabled: 1
>> [   91.108932] ath10k_pci 0000:05:00.0: could not request stats (type 128
>> ret -105)
>> [   91.108942] ath10k_pci 0000:05:00.0: hif-tx-sg, full, nentries_mask: 0x1f
>> write_idx: 2 sw-idx: 3  n_items: 1 pipe-id: 3
>> [   91.108944] ath10k_pci 0000:05:00.0: htc failed hif-tx-sq: -105 eid: 2
>> credits: 1 ep->tx_credits: 1  credit-flow-enabled: 1
>> [   91.108952] ath10k_pci 0000:05:00.0: could not request stats (type 1 ret
>> -105)
>> [   91.108953] ath10k_pci 0000:05:00.0: failed to get fw stats for ethtool:
>> -105
>> [   91.109039] ath10k_pci 0000:05:00.0: hif-tx-sg, full, nentries_mask: 0x1f
>> write_idx: 2 sw-idx: 3  n_items: 1 pipe-id: 3
>> [   91.109041] ath10k_pci 0000:05:00.0: htc failed hif-tx-sq: -105 eid: 2
>> credits: 1 ep->tx_credits: 1  credit-flow-enabled: 1
>> [   91.109050] ath10k_pci 0000:05:00.0: could not request stats (type 128
>> ret -105)
>> [   91.109060] ath10k_pci 0000:05:00.0: hif-tx-sg, full, nentries_mask: 0x1f
>> write_idx: 2 sw-idx: 3  n_items: 1 pipe-id: 3
>> [   91.109062] ath10k_pci 0000:05:00.0: htc failed hif-tx-sq: -105 eid: 2
>> credits: 1 ep->tx_credits: 1  credit-flow-enabled: 1
>> [   91.109070] ath10k_pci 0000:05:00.0: could not request stats (type 1 ret
>> -105)
>> [   91.109072] ath10k_pci 0000:05:00.0: failed to get fw stats for ethtool:
>> -105
>> [   91.109157] ath10k_pci 0000:05:00.0: hif-tx-sg, full, nentries_mask: 0x1f
>> write_idx: 2 sw-idx: 3  n_items: 1 pipe-id: 3
>> [   91.109160] ath10k_pci 0000:05:00.0: htc failed hif-tx-sq: -105 eid: 2
>> credits: 1 ep->tx_credits: 1  credit-flow-enabled: 1
>>
>>
>> I am struggling to understand how the pipe can be full since we have
>> tx-credits logic
>> enabled for the WMI pipe.
>>
>> Any suggestions on what sort of bugs could cause this?
>>
>> And, should the ath10k_wmi_cmd_send retry when we get a -105 return
>> code in hopes it will free up shortly instead of just failing and leaving
>> the system in invalid state?
>
> It probably shouldn't. As you've pointed out HTC tx credits should
> prevent this in the first place. If you see -105 it means something is
> really broken and needs to be fixed properly.
>
> A thing that comes to mind is that CE -for whatever reason- would need
> to stop completing CE ring items. Are you running with MSI? 1 or
> multiple interrupts? Did you try forcing legacy interrupt mode to rule
> out MSI problems?
>
> You could add a debug messages to see if the HTC-WMI CE ring gets tx
> completions properly.

I don't think I'm using MSI.  Could it be that whatever logic that should
be processing the tx-completions is just running slower than whatever is
handling the WMI messages (and credits)?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
