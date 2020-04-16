Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP3cV-0006Ke-HX
 for ath10k@lists.infradead.org; Thu, 16 Apr 2020 12:27:55 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v9 3/4] ath10k: add htt TX bundle for sdio
References: <20200212080415.31265-1-wgong@codeaurora.org>
 <20200212080415.31265-4-wgong@codeaurora.org>
 <87tv1su2vq.fsf@kamboji.qca.qualcomm.com>
 <185d31c2e6f8792beb240f2c74d26463@codeaurora.org>
 <87h7xmtrmv.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 16 Apr 2020 15:27:30 +0300
In-Reply-To: <87h7xmtrmv.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Tue, 14 Apr 2020 11:10:00 +0300")
Message-ID: <87o8rrr4y5.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Wen Gong <wgong@codeaurora.org> writes:
>
>> On 2020-04-09 22:53, Kalle Valo wrote:
>>> Wen Gong <wgong@codeaurora.org> writes:
>>>
>>>> +	ar->workqueue_tx_complete =
>>>> +		create_singlethread_workqueue("ath10k_tx_complete_wq");
>>>> +	if (!ar->workqueue_tx_complete)
>>>> +		goto err_free_aux_wq;
>>>
>>> We already have three threads:
>>>
>>> ath/ath10k/core.c:      ar->workqueue =
>>> create_singlethread_workqueue("ath10k_wq");
>>> ath/ath10k/core.c:      ar->workqueue_aux =
>>> create_singlethread_workqueue("ath10k_aux_wq");
>>> ath/ath10k/sdio.c:      ar_sdio->workqueue =
>>> create_singlethread_workqueue("ath10k_sdio_wq");
>>>
>>> Do we really need a fourth one? For example, why can't we use
>>> ar->workqueue_aux?
>>
>> For tcp test, it has 4 thread work meanwhile:
>> tx_bundle_skbs(ar->workqueue),
>> rx_indication(ar->workqueue_aux),
>> sdio_async_tx_request(ar_sdio->workqueue),
>> tx_bundle_complete(ar->workqueue_tx_complete)
>>
>> It has 4+ cpu/core in system, if reduced to 3 threads, then tcp
>> throughput will drop. only when it only has 1/2/3 cpu/core in system,
>> then reduced to 3 threads will not drop.
>
> How much does it drop? Please add the justification (with numbers) for
> the new thread to the commit log, so that the reason is properly
> documented.

I see that you already submitted v10. If you can give the numbers I can
add them to the commit log.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
