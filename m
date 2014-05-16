Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlHkM-00076A-5g
 for ath10k@lists.infradead.org; Fri, 16 May 2014 13:00:22 +0000
Message-ID: <53760BD0.8020507@candelatech.com>
Date: Fri, 16 May 2014 06:00:00 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: support get/set antenna configurations.
References: <1399942355-19993-1-git-send-email-apenwarr@gmail.com>	<1400015472-4647-1-git-send-email-apenwarr@gmail.com>
 <87ha4p7vow.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87ha4p7vow.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Avery Pennarun <apenwarr@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 05/16/2014 05:30 AM, Kalle Valo wrote:
> Avery Pennarun <apenwarr@gmail.com> writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Tested with CT firmware, but should work on standard
>> firmware as well.
>>
>> Verified that target's tx/rx chain register is set appropriately,
>> and that the tx rate goes down as number of chains
>> decrease, but I did not actually try to verify antenna
>> ceased to transmit when disabled.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> Signed-off-by: Avery Pennarun <apenwarr@gmail.com>
>
> I now moved ar->supp_*_chainmask initialisation to
> ath10k_mac_register(). Ben & Avery, is that for you two?
>
> Full patch here:
>
> https://github.com/kvalo/ath/commit/8230cdc4f434817d3c929292600fc3582e7dd3a8

Looks OK to me.

Thanks,
Ben

>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
