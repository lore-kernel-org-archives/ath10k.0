Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPLM3-00056z-He
 for ath10k@lists.infradead.org; Fri, 17 Apr 2020 07:24:07 +0000
MIME-Version: 1.0
Date: Fri, 17 Apr 2020 15:23:44 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH] ath10k: improve power save performance for sdio
In-Reply-To: <87y2quponn.fsf@kamboji.qca.qualcomm.com>
References: <0101016ed9241282-73dd8b35-e2e5-4f37-9b50-cf2fb6524dfc-000000@us-west-2.amazonses.com>
 <877dyfr4fb.fsf@kamboji.qca.qualcomm.com>
 <b9f680d57a6fbc9ac59dc5fc281d0af3@codeaurora.org>
 <87y2quponn.fsf@kamboji.qca.qualcomm.com>
Message-ID: <ffdecd6a9db5b96d6c791fc04108b163@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2020-04-17 15:17, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> writes:
> 
>> On 2020-04-16 20:38, Kalle Valo wrote:
>>> Wen Gong <wgong@codeaurora.org> writes:
>>> 
>> 
>>> 
>>>> +static inline int ath10k_hif_set_mbox_sleep(struct ath10k *ar,
>>>> bool enable_sleep)
>>>> +{
>>>> +	if (ar->hif.ops->set_mbox_sleep)
>>>> +		return ar->hif.ops->set_mbox_sleep(ar, enable_sleep);
>>>> +	return 0;
>>>> +}
>>> 
>>> I don't think we need to add another hif op for this. I sent v2 which
>>> uses existing op.
>> 
>> Yes, I see it. but I see it removed ath10k_hif_set_mbox_sleep in
>> ath10k_core_start, expected it will not effect the patch's power save.
> 
> So the idea is that the same functionality is still there as with your
> version, the callpath is just a bit different:
> 
> ath10k_core_start()
>     -> ath10k_hif_start_post()
>         -> ath10k_sdio_hif_start_post()
>             -> ath10k_sdio_set_mbox_sleep()
> 
> But please do double check that I didn't miss anything.
yes, I see this now, so it not miss in v2.
@@ -1749,6 +1819,8 @@  static int ath10k_sdio_hif_start_post(struct 
ath10k *ar)
  		ar_sdio->swap_mbox = false;
  	}

+	ath10k_sdio_hif_set_mbox_sleep(ar, true);
+
  	return 0;
  }

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
