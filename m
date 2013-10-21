Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x235.google.com ([2a00:1450:400c:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VY9LY-0002wb-Dw
 for ath10k@lists.infradead.org; Mon, 21 Oct 2013 06:52:13 +0000
Received: by mail-we0-f181.google.com with SMTP id t60so6112037wes.12
 for <ath10k@lists.infradead.org>; Sun, 20 Oct 2013 23:51:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87iowruocz.fsf@kamboji.qca.qualcomm.com>
References: <1382090878-22216-1-git-send-email-bartosz.markowski@tieto.com>
 <1382090878-22216-2-git-send-email-bartosz.markowski@tieto.com>
 <87iowruocz.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 21 Oct 2013 08:51:47 +0200
Message-ID: <CACKGw+EKg_5FQMvGPHxpvgt9wukyU5HD1jx++WkyYNLA3bBFSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: extend number of AP interfaces for 10.X
 firmware
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On 21 October 2013 08:31, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Bartosz Markowski <bartosz.markowski@tieto.com> writes:
>
>> This firmware can support up to 8 AP interfaces.
>>
>> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/mac.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index af046c4..dc65dcd 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -3255,7 +3255,7 @@ static const struct ieee80211_iface_limit ath10k_10x_if_limits[] = {
>>       .types  = BIT(NL80211_IFTYPE_STATION)
>>       },
>>       {
>> -     .max    = 7,
>> +     .max    = 8,
>>       .types  = BIT(NL80211_IFTYPE_AP)
>>       },
>>  };
>
> Why only with 10.x firmware branch? Doesn't the main branch support 8
> interfaces?

With .636 there's a firmware crash when we try to create interface 8 (ap mode).

-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
