Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlIrY-0005Qd-Rx
 for ath10k@lists.infradead.org; Fri, 16 May 2014 14:11:53 +0000
Message-ID: <53761C7F.80505@candelatech.com>
Date: Fri, 16 May 2014 07:11:11 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k:  improve vdev map handling.
References: <1398882179-17100-1-git-send-email-greearb@candelatech.com>
 <878uq16e08.fsf@kamboji.qca.qualcomm.com> <53761A35.2000308@candelatech.com>
 <87bnux4y42.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87bnux4y42.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 05/16/2014 07:06 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> On 05/16/2014 06:37 AM, Kalle Valo wrote:
>>
>>>> -	ar->free_vdev_map &= ~BIT(arvif->vdev_id);
>>>> +	ar->free_vdev_map &= ~(1 << arvif->vdev_id);
>>>
>>> Why remove the BIT()? Not that it matters much, I just think it's easier
>>> to read when BIT() macro is used. Would be good to convert all cases to
>>> use BIT anyway, but that's for a separate patch.
>>
>> BIT doesn't work on 64-bit numbers (ie, if vdev_id > 31)
> 
> Oh, I didn't know that. Too bad, but then removing it makes sense.
> 
>> and it takes a long time to figure out exactly what it does (try
>> grepping for BIT). Open-coding means much easier to fully understand
>> the code.
> 
> All Linux engineers should know what BIT() does. If not, they should
> learn that ;)

Yeah, but see your comment above :P

Pain in the ass to track down the difference between (1 << x) and (1LLU << x),
and even worse when it's hidden behind a macro.

Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
