Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biLtN-0003rp-RZ
 for ath10k@lists.infradead.org; Fri, 09 Sep 2016 13:30:55 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k:  Improve logging message.
Date: Fri, 9 Sep 2016 13:30:21 +0000
Message-ID: <87oa3xp5ea.fsf@kamboji.qca.qualcomm.com>
References: <1471569995-10028-1-git-send-email-greearb@candelatech.com>
 <1471569995-10028-3-git-send-email-greearb@candelatech.com>
 <20160819063511.GA16230@atheros-ThinkPad-T61>
In-Reply-To: <20160819063511.GA16230@atheros-ThinkPad-T61> (Mohammed Shafi
 Shajakhan's message of "Fri, 19 Aug 2016 12:05:11 +0530")
Content-Language: en-US
Content-ID: <D0A35002A6F1A24F990EF99CB94CDC71@qualcomm.com>
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
To: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Cc: "greearb@candelatech.com" <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@codeaurora.org> writes:

> Hi Ben,
>
> On Thu, Aug 18, 2016 at 06:26:35PM -0700, greearb@candelatech.com wrote:
>> From: Ben Greear <greearb@candelatech.com>
>> 
>> Helps to know the sta pointer.
>> 
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/mac.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index d96c06e..82bc0da 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -6491,8 +6491,8 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
>>  		 * Existing station deletion.
>>  		 */
>>  		ath10k_dbg(ar, ATH10K_DBG_MAC,
>> -			   "mac vdev %d peer delete %pM (sta gone)\n",
>> -			   arvif->vdev_id, sta->addr);
>> +			   "mac vdev %d peer delete %pM (sta gone) sta: %p\n",
>> +			   arvif->vdev_id, sta->addr, sta);
>
> good to rebase over Maharaja's change (%p to %pK) 
> https://patchwork.kernel.org/patch/9263691/

I added that to the patch in the pending branch.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
