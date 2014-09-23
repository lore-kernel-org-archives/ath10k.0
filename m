Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWQyy-00071B-C2
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 14:22:20 +0000
Message-ID: <54218207.6050907@candelatech.com>
Date: Tue, 23 Sep 2014 07:21:59 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath10k:  use 64-bit vdev map.
References: <1411149890-12618-1-git-send-email-greearb@candelatech.com>
 <878ulaebug.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <878ulaebug.fsf@kamboji.qca.qualcomm.com>
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



On 09/23/2014 05:54 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> This can allow more than 32 stations to be supported
>> without over-running the bitmap.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>
> [...]
>
>> -	ar->monitor_vdev_id = bit - 1;
>> +	ar->monitor_vdev_id = bit;
>
> [...]
>
>> -	arvif->vdev_id = bit - 1;
>> +	ath10k_warn(ar, "Creating vdev id: %i  map: %llu\n",
>> +		    bit, ar->free_vdev_map);
>> +
>> +	arvif->vdev_id = bit;
>
> Why remove the "- 1"? Are you sure that's not going to break any
> assumptions somewhere?

I have been testing this patch in one form or another for almost a year
and have not noticed any problems with it.

The return value is subtly different when using the 64-bit version,
so you don't need the -1.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
