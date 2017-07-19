Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXtSx-0006RN-Tg
 for ath10k@lists.infradead.org; Wed, 19 Jul 2017 18:12:57 +0000
Received: by mail-wm0-x244.google.com with SMTP id n64so973638wmg.2
 for <ath10k@lists.infradead.org>; Wed, 19 Jul 2017 11:12:34 -0700 (PDT)
Subject: Re: [PATCH] ath10k_htt_rx_amsdu_allowed(): use ath10k_dbg()
References: <288fce5b-d738-f0ac-2433-67e1b35a0664@gmail.com>
 <1500481605.25934.40.camel@perches.com>
From: Gabriel C <nix.or.die@gmail.com>
Message-ID: <7a1578a8-68fc-4cc5-b659-a11c25508245@gmail.com>
Date: Wed, 19 Jul 2017 20:12:32 +0200
MIME-Version: 1.0
In-Reply-To: <1500481605.25934.40.camel@perches.com>
Content-Language: en-US
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
To: Joe Perches <joe@perches.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Ryan Hsu <ryanhsu@qti.qualcomm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On 19.07.2017 18:26, Joe Perches wrote:
> On Wed, 2017-07-19 at 17:37 +0200, Gabriel C wrote:
>>           Each time we get disconencted from AP we get flooded with messages like:
>>
>>           ...
>>           ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
>>           <until ratelimit kicks in>
>>           ath10k_warn: 155 callbacks suppressed
> 
> []
> 
>> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> []
>> @@ -1514,7 +1514,7 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k *ar,
>>            */
>>
>>           if (!rx_status->freq) {
>> -               ath10k_warn(ar, "no channel configured; ignoring frame(s)!\n");
>> +               ath10k_dbg(ar, ATH10K_DBG_HTT, "no channel configured; ignoring frame(s)!\n");
>>                   return false;
>>           }
> 
> Hi.  This doesn't apply because of tab to space conversions.
> 
> Please use git send-email to send your patch.

Yes you are right .. I think newer thunderbird just doesn't work anymore to send patches.

Will have a look to setup git send-email and resend.

> 
> Maybe read Documentation/process/email-clients.rst
> 

I use tbird to send patches forver but it seems latest updates here broke it some sort.





_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
