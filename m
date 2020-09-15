Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIBxF-0007g5-0U
 for ath10k@lists.infradead.org; Tue, 15 Sep 2020 14:29:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 0/2] ath10k: Fixes during subsystem recovery
References: <1593197633-9014-1-git-send-email-pillair@codeaurora.org>
 <005d01d68b34$7bfc4960$73f4dc20$@codeaurora.org>
Date: Tue, 15 Sep 2020 17:28:40 +0300
In-Reply-To: <005d01d68b34$7bfc4960$73f4dc20$@codeaurora.org> (Rakesh Pillai's
 message of "Tue, 15 Sep 2020 13:17:34 +0530")
Message-ID: <87lfhbnmg7.fsf@codeaurora.org>
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

"Rakesh Pillai" <pillair@codeaurora.org> writes:

>> -----Original Message-----
>> From: Rakesh Pillai <pillair@codeaurora.org>
>> Sent: Saturday, June 27, 2020 12:24 AM
>> To: ath10k@lists.infradead.org
>> Cc: linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org; Rakesh
>> Pillai <pillair@codeaurora.org>
>> Subject: [PATCH v2 0/2] ath10k: Fixes during subsystem recovery
>> 
>> This patch series includes some fixes when the device
>> is in recovery mode, i.e. when the firmware goes down.
>> 
>> - Pausing TX queues when FW goes down
>> - Removed unwanted/extra error logging in pkt TX path
>> - Skipping wait for FW response for delete cmds
>> - Handling the -ESHUTDOWN error code in case of SSR.
>> 
>> Rakesh Pillai (2):
>>   ath10k: Pause the tx queues when firmware is down
>>   ath10k: Skip wait for delete response if firmware is down
>> 
>>  drivers/net/wireless/ath/ath10k/core.h |  1 +
>>  drivers/net/wireless/ath/ath10k/mac.c  | 36 ++++++++++++++++++++++---
>> ---------
>>  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>>  3 files changed, 28 insertions(+), 12 deletions(-)
>
> Hi Kalle,
> I see that this patch series is in Deferred state. Is there something
> missing or blocking this ?

Yeah, time to review it ;) I still have quite a lot of patches in
deferred state but I'm trying to go through it, albeit slowly.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
