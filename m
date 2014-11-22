Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsDEJ-0003DE-Jd
 for ath10k@lists.infradead.org; Sat, 22 Nov 2014 16:08:12 +0000
Message-ID: <5470B4D5.7090508@candelatech.com>
Date: Sat, 22 Nov 2014 08:07:49 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 04/10] ath10k: make firmware text debug messages more
 verbose.
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>	<1411507045-18973-4-git-send-email-greearb@candelatech.com>
 <878uj38dbd.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <878uj38dbd.fsf@kamboji.qca.qualcomm.com>
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



On 11/22/2014 07:28 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> There are not many of these messages producted by the
>> firmware, but they are generally fairly useful, so print
>> them at info level.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>
> [...]
>
>> --- a/drivers/net/wireless/ath/ath10k/debug.h
>> +++ b/drivers/net/wireless/ath/ath10k/debug.h
>> @@ -35,6 +35,7 @@ enum ath10k_debug_mask {
>>   	ATH10K_DBG_BMI		= 0x00000400,
>>   	ATH10K_DBG_REGULATORY	= 0x00000800,
>>   	ATH10K_DBG_TESTMODE	= 0x00001000,
>> +	ATH10K_DBG_FW_MSG	= 0x00002000,
>
> I think FW_MSG is a bit too ambiguous, so I changed this to WMI_PRINT so
> that it's closer the real event name.

Better than nothing, but my idea was that this flag would be able to affect
more than one thing related to firmware debugging.  Calling it something about
WMI does not indicate to me that it is really about firmware debugging.

Thanks,
Ben

> Full patch: https://github.com/kvalo/ath/commit/ce4269787f4b5e538731f34cb3a7358343efaa00
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
