Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJ87-0001BV-D5
 for ath10k@lists.infradead.org; Mon, 07 Dec 2020 16:12:52 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: skip the wait for completion to recovery in
 shutdown path
References: <20201126171553.2097-1-youghand@codeaurora.org>
 <CA+ASDXOvnfETrKs2ZbayZsRkUEpUbaeMGRkZNRCXa=M28HHE-w@mail.gmail.com>
Date: Mon, 07 Dec 2020 18:12:38 +0200
In-Reply-To: <CA+ASDXOvnfETrKs2ZbayZsRkUEpUbaeMGRkZNRCXa=M28HHE-w@mail.gmail.com>
 (Brian Norris's message of "Tue, 1 Dec 2020 11:35:44 -0800")
Message-ID: <87y2i9egsp.fsf@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: kuabhs@chromium.org, Youghandhar Chintala <youghand@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, ath10k <ath10k@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Rakesh Pillai <pillair@codeaurora.org>

Brian Norris <briannorris@chromium.org> writes:

> On Thu, Nov 26, 2020 at 9:16 AM Youghandhar Chintala
> <youghand@codeaurora.org> wrote:
>> --- a/drivers/net/wireless/ath/ath10k/snoc.c
>> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
>> @@ -1790,9 +1790,6 @@ static int ath10k_snoc_remove(struct platform_device *pdev)
>>
>>         reinit_completion(&ar->driver_recovery);
>>
>> -       if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
>> -               wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);
>
> Hmm, this is the only instance of waiting for this completion, which
> means that after this patch, 'ar->driver_recovery' is doing exactly
> nothing. Should you instead just remove it completely?
>
> Also, if your patch is correct, it seems like the completion was never
> needed in the first place. You should probably address such a claim in
> the commit message; is there truly no need to wait here? Or was there
> some purpose here, but that purpose was accomplished some other way?
> Or was there a purpose, and that purpose was misguided? It feels to me
> like it is indeed correct to remove this (shutdown should be performed
> promptly; we don't need to delay it just to try to "finish
> recovering"), but it's your job to convince the reader.

Exactly what I was thinking as well. To me this patch was just looks
racy and all the commit log says that it's "unwanted delay".

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
