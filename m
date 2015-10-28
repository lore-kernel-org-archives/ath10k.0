Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrQuK-0001YL-Su
 for ath10k@lists.infradead.org; Wed, 28 Oct 2015 13:36:53 +0000
Received: by lbbes7 with SMTP id es7so5761656lbb.2
 for <ath10k@lists.infradead.org>; Wed, 28 Oct 2015 06:36:31 -0700 (PDT)
Subject: Re: [RESEND PATCH 07/10] net: wireless: iwlegacy: Remove unneeded
 variable ret
References: <1445972565-14963-1-git-send-email-punitvara@gmail.com>
 <1445972565-14963-7-git-send-email-punitvara@gmail.com>
 <5630CF11.8080504@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5630CF5E.1030801@cogentembedded.com>
Date: Wed, 28 Oct 2015 16:36:30 +0300
MIME-Version: 1.0
In-Reply-To: <5630CF11.8080504@cogentembedded.com>
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
To: Punit Vara <punitvara@gmail.com>, kvalo@qca.qualcomm.com
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

On 10/28/2015 4:35 PM, Sergei Shtylyov wrote:

>> This patch is to the 3945-mac.c file that fixes up following warning
>> by coccicheck:
>>
>> drivers/net/wireless/iwlegacy/3945-mac.c:247:5-8: Unneeded variable:
>> "ret". Return "- EOPNOTSUPP" on line 249
>>
>> Return -EOPNOTSUPP directly instead of return using ret
>>
>> Signed-off-by: Punit Vara <punitvara@gmail.com>
>> ---
>>   drivers/net/wireless/iwlegacy/3945-mac.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/wireless/iwlegacy/3945-mac.c
>> b/drivers/net/wireless/iwlegacy/3945-mac.c
>> index af1b3e6..ff4dc44 100644
>> --- a/drivers/net/wireless/iwlegacy/3945-mac.c
>> +++ b/drivers/net/wireless/iwlegacy/3945-mac.c
>> @@ -244,9 +244,7 @@ il3945_set_dynamic_key(struct il_priv *il, struct
>> ieee80211_key_conf *keyconf,
>>   static int
>>   il3945_remove_static_key(struct il_priv *il)
>>   {
>> -    int ret = -EOPNOTSUPP;
>> -
>> -    return ret;
>> +    return -EOPNOTSUPP;
>>   }
>>
>>   static int
>> @@ -529,7 +527,6 @@ il3945_tx_skb(struct il_priv *il,
>>           if (unlikely(tid >= MAX_TID_COUNT))
>>               goto drop;
>>       }
>> -
>
>     Unrelated white space change.

    And I've already complained about it! Please remove this hunk.

MBR, Sergei


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
