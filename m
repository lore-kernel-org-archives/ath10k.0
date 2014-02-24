Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHz17-0003x2-GN
 for ath10k@lists.infradead.org; Mon, 24 Feb 2014 17:08:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Anyone have luck with WLE900VX?
References: <5307F7D3.1030703@candelatech.com>
 <87fvn8trh2.fsf@kamboji.qca.qualcomm.com>
 <530B74E1.8040908@candelatech.com>
Date: Mon, 24 Feb 2014 19:08:05 +0200
In-Reply-To: <530B74E1.8040908@candelatech.com> (Ben Greear's message of "Mon, 
 24 Feb 2014 08:35:45 -0800")
Message-ID: <87txbosakq.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> On 02/24/2014 08:17 AM, Kalle Valo wrote:
>> Ben Greear <greearb@candelatech.com> writes:
>> 
>>> I managed to get a few WLE900VX, and I've seen some funny things so far.
>> 
>> Do you have any more info what type of board it is? Is it CUS223, XBNNN
>> (N being a decimal) or something else?
>
> http://www.compex.com.sg/Datasheets/WLE900VX_Dsv1.0.0.pdf
>
> I was told the ref design, but cannot remember it..will ask
> again.  It is not a high power design like the CUS223, evidently.

No need to ask, the PDF even mentions it:

"Qualcomm-Atheros QCA9880 Version 2, XB140 Reference Design"

XB140 is a dual band 3x3 board.

>> What's the chip id?
>
> 05:00.0 Network controller: Atheros Communications Inc. Device 003c
> 	Flags: bus master, fast devsel, latency 0, IRQ 18
> 	Memory at f4400000 (64-bit, non-prefetchable) [size=2M]
> 	Expansion ROM at f4600000 [disabled] [size=64K]
> 	Capabilities: [40] Power Management version 2
> 	Capabilities: [50] MSI: Enable- Count=1/8 Maskable+ 64bit-
> 	Capabilities: [70] Express Endpoint, MSI 00
> 	Capabilities: [100] Advanced Error Reporting
> 	Capabilities: [140] Virtual Channel
> 	Capabilities: [160] Device Serial Number 00-00-00-00-00-00-00-00
> 	Kernel driver in use: ath10k_pci

I was actually referring to the internal chip id, not PCI id, which is a
good way to check what chip it really is:

static int ath10k_core_check_chip_id(struct ath10k *ar)
{
	u32 hw_revision = MS(ar->chip_id, SOC_CHIP_ID_REV);

	ath10k_dbg(ATH10K_DBG_BOOT, "boot chip_id 0x%08x hw_revision 0x%x\n",
		   ar->chip_id, hw_revision);

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
