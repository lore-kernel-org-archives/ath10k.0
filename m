Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YOJHa-0008TS-EW
 for ath10k@lists.infradead.org; Thu, 19 Feb 2015 05:04:14 +0000
Message-ID: <54E56EAC.2030906@candelatech.com>
Date: Wed, 18 Feb 2015 21:03:40 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: station kickout
References: <54D29F71.50603@candelatech.com>
 <87d25bi98f.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87d25bi98f.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>



On 02/15/2015 05:40 AM, Kalle Valo wrote:
> (Adding linux-wireless)
>
> Ben Greear <greearb@candelatech.com> writes:
>
>> In AP mode, it seems that 3.17-ish kernels (at least) always set station kickout
>> to hard-coded value of 50.
>>
>> Is this something that should be configurable?  Maybe a module parameter
>> if nothing else?
>
> Or should we add this to nl80211/cfg80211/mac80211? I would guess other
> drivers also have similar functionality.

I guess that is up to Johannes.  Do we really gain anything useful by letting
firmware take care of this?  Might be best to just disable the firmware option
entirely and let the rest of the mac80211 stack take care of detecting
loss of connectivity?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
