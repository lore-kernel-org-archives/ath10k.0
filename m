Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVMcH-0006SK-6y
 for ath10k@lists.infradead.org; Wed, 02 Apr 2014 14:58:15 +0000
Message-ID: <533C256B.9090209@candelatech.com>
Date: Wed, 02 Apr 2014 07:57:47 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] ath10k:  add helper method to grab debug stats.
References: <1396374940-21453-1-git-send-email-greearb@candelatech.com>
 <8738hwrxso.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <8738hwrxso.fsf@kamboji.qca.qualcomm.com>
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

On 04/02/2014 12:32 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> It can be nice to update the firmware's stats while
>> debugging other bits of the driver, so add helper method
>> to do this.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>
> [...]
>
>> --- a/drivers/net/wireless/ath/ath10k/debug.h
>> +++ b/drivers/net/wireless/ath/ath10k/debug.h
>> @@ -135,4 +135,6 @@ struct dbglog_hdr_s {
>>
>>   void ath10k_dbg_print_fw_dbg_buffer(u8 *buffer, int len, const char* lvl);
>>
>> +int ath10k_refresh_peer_stats(struct ath10k *ar);
>
> I don't see anyone calling this. How are you planning to use it?


The RFC patch that debugs tx-hang calls it..nice to see he firmware's
buffer reap stats and such before/after trying to flush the buffers.

I figure it will be useful for other such uses as well, now that stats
actually work.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
