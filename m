Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh1jM-0003WQ-5y
 for ath10k@lists.infradead.org; Tue, 29 Sep 2015 20:42:32 +0000
Subject: Re: Bug in CCK hw_rate definitions?
References: <55F88F08.1000703@candelatech.com>
 <CA+BoTQ=C3v+tMoM9_-Q7iTDRy=Zx0gxxib1gxkoOaK3tYpoBvg@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <560AF7A1.7080408@candelatech.com>
Date: Tue, 29 Sep 2015 13:42:09 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=C3v+tMoM9_-Q7iTDRy=Zx0gxxib1gxkoOaK3tYpoBvg@mail.gmail.com>
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

On 09/21/2015 12:32 AM, Michal Kazior wrote:
> On 15 September 2015 at 23:35, Ben Greear <greearb@candelatech.com> wrote:
>> ath10k hw.h has this:
>>
>> enum ath10k_hw_rate_cck {
>>          ATH10K_HW_RATE_CCK_LP_11M = 0,
>>          ATH10K_HW_RATE_CCK_LP_5_5M,
>>          ATH10K_HW_RATE_CCK_LP_2M,
>>          ATH10K_HW_RATE_CCK_LP_1M,
>>
>> But, at least in 10.1 firmware, it appears that CCK hw_rates are 0x40, 0x41,
>> etc
>> (For those of you with firmware, see ar600P_phy.c, 'RC' column of the rate
>> table.)
>>
>> Am I missing something or is the driver code just wrong?
>
> These macros are used only to decode L_SIG_RATE now. It can take values 0..15.
>
> If you need/want to change ath10k_hw_rate_cck you'll need to make sure
> to update ath10k_mac_hw_rate_to_idx() or its callsite accordingly.

Just to close the loop on this:

I was confused about exactly how this was being used.

In the end, I have this working to my satisfaction without having
to change the enums.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
