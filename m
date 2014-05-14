Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkYId-0000xa-8C
 for ath10k@lists.infradead.org; Wed, 14 May 2014 12:28:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: support get/set antenna configurations.
References: <5370F41A.70202@candelatech.com>
 <1399942355-19993-1-git-send-email-apenwarr@gmail.com>
 <87y4y5h7mc.fsf@kamboji.qca.qualcomm.com>
 <53726148.3090503@candelatech.com>
 <CAHqTa-111nY-nqiU99HkwAermVEE8zotVFg3VDA4AMtZyCKUcw@mail.gmail.com>
Date: Wed, 14 May 2014 15:28:15 +0300
In-Reply-To: <CAHqTa-111nY-nqiU99HkwAermVEE8zotVFg3VDA4AMtZyCKUcw@mail.gmail.com>
 (Avery Pennarun's message of "Tue, 13 May 2014 17:03:56 -0400")
Message-ID: <87mwekh7ds.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Avery Pennarun <apenwarr@gmail.com> writes:

> On Tue, May 13, 2014 at 2:15 PM, Ben Greear <greearb@candelatech.com> wrote:
>> On 05/13/2014 11:10 AM, Kalle Valo wrote:
>>>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>>>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>>>> @@ -2558,6 +2558,8 @@ static int ath10k_wmi_main_cmd_init(struct ath10k *ar)
>>>>      config.ast_skid_limit = __cpu_to_le32(TARGET_AST_SKID_LIMIT);
>>>>      config.tx_chain_mask = __cpu_to_le32(TARGET_TX_CHAIN_MASK);
>>>>      config.rx_chain_mask = __cpu_to_le32(TARGET_RX_CHAIN_MASK);
>>>> +    ar->supp_tx_chainmask = TARGET_TX_CHAIN_MASK;
>>>> +    ar->supp_rx_chainmask = TARGET_RX_CHAIN_MASK;
>>>>      config.rx_timeout_pri_vo = __cpu_to_le32(TARGET_RX_TIMEOUT_LO_PRI);
>>>>      config.rx_timeout_pri_vi = __cpu_to_le32(TARGET_RX_TIMEOUT_LO_PRI);
>>>>      config.rx_timeout_pri_be = __cpu_to_le32(TARGET_RX_TIMEOUT_LO_PRI);
>>>> @@ -2652,6 +2654,9 @@ static int ath10k_wmi_10x_cmd_init(struct ath10k *ar)
>>>>      config.ast_skid_limit = __cpu_to_le32(TARGET_10X_AST_SKID_LIMIT);
>>>>      config.tx_chain_mask = __cpu_to_le32(TARGET_10X_TX_CHAIN_MASK);
>>>>      config.rx_chain_mask = __cpu_to_le32(TARGET_10X_RX_CHAIN_MASK);
>>>> +    /* TODO:  Have to deal with 2x2 chips if/when the come out. */
>>>> +    ar->supp_tx_chainmask = TARGET_10X_TX_CHAIN_MASK;
>>>> +    ar->supp_rx_chainmask = TARGET_10X_RX_CHAIN_MASK;
>>>>      config.rx_timeout_pri_vo = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);
>>>>      config.rx_timeout_pri_vi = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);
>>>>      config.rx_timeout_pri_be = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);
>>>
>>> This initialisation looks out of place as we these variables have
>>> nothing to do with the actual WMI_INIT_CMDID command. And besides, they
>>> would get overwritten every time we start the firmware. Is that on
>>> purpose?
>>>
>>> I think we should find more approriate place, for example
>>> ath10k_mac_register() would be one to look at.
>>
>> It doesn't hurt that they are over-written, but probably it
>> can be done better.
>
> As far as I can see, supp_{tx,rx}_chainmask are effectively constants.
>  So it kind of makes sense to me to initialize them here with a bunch
> of other constants.  cfg_{tx,rx}_chainmask do not seem to be
> initialized ever (so I guess they default to zero, and we don't change
> the antenna mask unless they are set).  I think this looks safe.

The purpose of ath10k_wmi_main_cmd_init() to initiatialise 'struct
wmi_init_cmd' and send it to the firmware, it should not do anything
else. Initialisation of the fields in question do not belong to that
function, that kind of higher level logic should be the responsibility
of mac.c.

My idea here is that wmi.c is implementening WMI as a protocol, and
mac.c then just uses wmi.c as protocol abstraction mac.c. The exception
we have are the WMI event handling and that's just to keep the code
simple.

>> I'm knee deep in other bugs though...maybe Avery has time to
>> address this.
>
> I'll respin the patch with the other suggested changed.  If you guys
> think the supp_{tx,rx}_chainmask stuff should be moved elsewhere, let
> me know where and I can make another one :)

I want to keep the architecture of ath10k clean and that's why I really
would prefer to have this somewhere else than in wmi.c.

BTW, please also CC linux-wireless when submitting ath10k patches. I
have documented the process here:

http://wireless.kernel.org/en/users/Drivers/ath10k/sources#Submitting_patches

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
