Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHzpg-0006Au-Dq
 for ath10k@lists.infradead.org; Mon, 24 Feb 2014 18:00:49 +0000
Message-ID: <530B88BA.1020602@candelatech.com>
Date: Mon, 24 Feb 2014 10:00:26 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone have luck with WLE900VX?
References: <5307F7D3.1030703@candelatech.com>
 <87fvn8trh2.fsf@kamboji.qca.qualcomm.com> <530B74E1.8040908@candelatech.com>
 <87txbosakq.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87txbosakq.fsf@kamboji.qca.qualcomm.com>
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

On 02/24/2014 09:08 AM, Kalle Valo wrote:

> I was actually referring to the internal chip id, not PCI id, which is a
> good way to check what chip it really is:
> 
> static int ath10k_core_check_chip_id(struct ath10k *ar)
> {
> 	u32 hw_revision = MS(ar->chip_id, SOC_CHIP_ID_REV);
> 
> 	ath10k_dbg(ATH10K_DBG_BOOT, "boot chip_id 0x%08x hw_revision 0x%x\n",
> 		   ar->chip_id, hw_revision);
> 

Ahh, like this?

ath10k: boot chip_id 0x043202ff hw_revision 0x2


I do not see any OTP errors when loading my firmware, at least not
as seen from the ath10k driver.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
