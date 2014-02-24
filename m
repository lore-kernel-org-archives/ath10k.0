Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHyVk-0002ty-A7
 for ath10k@lists.infradead.org; Mon, 24 Feb 2014 16:36:10 +0000
Message-ID: <530B74E1.8040908@candelatech.com>
Date: Mon, 24 Feb 2014 08:35:45 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone have luck with WLE900VX?
References: <5307F7D3.1030703@candelatech.com>
 <87fvn8trh2.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87fvn8trh2.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 02/24/2014 08:17 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> I managed to get a few WLE900VX, and I've seen some funny things so far.
> 
> Do you have any more info what type of board it is? Is it CUS223, XBNNN
> (N being a decimal) or something else?

http://www.compex.com.sg/Datasheets/WLE900VX_Dsv1.0.0.pdf

I was told the ref design, but cannot remember it..will ask
again.  It is not a high power design like the CUS223, evidently.

> What's the chip id?

05:00.0 Network controller: Atheros Communications Inc. Device 003c
	Flags: bus master, fast devsel, latency 0, IRQ 18
	Memory at f4400000 (64-bit, non-prefetchable) [size=2M]
	Expansion ROM at f4600000 [disabled] [size=64K]
	Capabilities: [40] Power Management version 2
	Capabilities: [50] MSI: Enable- Count=1/8 Maskable+ 64bit-
	Capabilities: [70] Express Endpoint, MSI 00
	Capabilities: [100] Advanced Error Reporting
	Capabilities: [140] Virtual Channel
	Capabilities: [160] Device Serial Number 00-00-00-00-00-00-00-00
	Kernel driver in use: ath10k_pci


>> First, with the official firmware 10.1.467.1-1 it immediately crashes on startup.
>> I don't have that firmware source, so I don't know why it crashes.
>> I wasn't even trying to create more than the default wlanX station.
> 
> Is that with stock ath10k driver or does ath10k contain any custom
> changes?

It had custom changes, and at least one patch that might cause
trouble:  The one that doubled the number of key cache entries that
I posted a few days ago.

I can try with all that backed out.

>> With my firmware (based on 10.1.389), it boots up OK and I can create
>> and associate 32 station vifs.
>>
>> Both NICs that I have tried so far report the same mostly bogus
>> MAC:  00:03:07:12:34:56
>>
>> The NIC's spec sheet claims it is 3x3, but 'iw phy phyX info' shows only
>> 2 streams supported for both the 2.4Ghz n band and the 5Ghz /ac band.
> 
> Hmm, I wonder if otp.bin fails. Can you check what result code you get
> from otp.bin? Add something like this to ath10k_download_and_run_otp():
> 
> 	ret = ath10k_bmi_execute(ar, address, &exec_param);
>         ath10k_dbg(ATH10K_DBG_BOOT, "boot otp execute result %d\n", exec_param);


Will do, thanks!

Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
