Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlI9Y-0007Ht-OE
 for ath10k@lists.infradead.org; Fri, 16 May 2014 13:26:25 +0000
Message-ID: <537611EB.9050208@candelatech.com>
Date: Fri, 16 May 2014 06:26:03 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k:  improve vdev map handling.
References: <1398882179-17100-1-git-send-email-greearb@candelatech.com>
 <87fvk96ewc.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87fvk96ewc.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 05/16/2014 06:18 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Check vdev map has space before calling ffs,
>> fix invalid cleanup in failure to create vdev
>> case.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>
> Why? What motivated you to write this? If you saw a bug, it would be
> good to document the bug in the commit log.
>
>> This is compile-tested only.
>
> It's two weeks since you posted this, sorry for taking so long. But have
> you managed to test this by now?

The code is cleaner with my patch, and it makes it easier to
use the 64-bit version of ffs.

I have tested this extensively in my tree with the 64-bit version
of ffs so that I can have more than 32 vdevs.

It does fix a problem I found through code inspection as well,
when it did not properly release a slot in a failure path.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
