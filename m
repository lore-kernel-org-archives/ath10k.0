Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMSFb-0006Jp-BA
 for ath10k@lists.infradead.org; Fri, 03 May 2019 07:04:57 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] ath10k: Fix rate table updation in tx stats
References: <1552319602-17795-2-git-send-email-pillair@codeaurora.org>
 <20190503060032.23F1C61195@smtp.codeaurora.org>
 <edfbff30627849996b0597b964ed018c@codeaurora.org>
Date: Fri, 03 May 2019 10:04:50 +0300
In-Reply-To: <edfbff30627849996b0597b964ed018c@codeaurora.org> (Rakesh
 Pillai's message of "Fri, 03 May 2019 12:26:31 +0530")
Message-ID: <87d0l0koh9.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

(please don't top post, fixing that manually)

Rakesh Pillai <pillair@codeaurora.org> writes:

> On 2019-05-03 11:30, Kalle Valo wrote:
>> Rakesh Pillai <pillair@codeaurora.org> wrote:
>>
>>> The index for updating rate table, which is displayed
>>> in the tx stats via debugfs, is calculated using the
>>> bandwidth value. The bandwidth values do not map
>>> correctly with the bandwidth values shown in the rate table.
>>>
>>> Correct the bandwidth value calculation which is used
>>> to calculate the index for rate table updation for tx stats.
>>>
>>> Tested HW: WCN3990
>>> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
>>>
>>> Fixes: e88975ca37d1 ("ath10k: dump tx stats in rate table format")
>>> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
>>
>> Fails to compile:
>>
>> drivers/net/wireless/ath/ath10k/htt_rx.c: In function
>> 'ath10k_accumulate_per_peer_tx_stats':
>> drivers/net/wireless/ath/ath10k/htt_rx.c:3252:14: error: implicit
>> declaration of function 'ath10k_get_bw'; did you mean
>> 'ath10k_get_tid'? [-Werror=implicit-function-declaration]
>>   rtable_bw = ath10k_get_bw(&ar->hw_params, pstats->flags);
>>               ^~~~~~~~~~~~~
>>               ath10k_get_tid
>
> This set of patches is dependent on
> https://patchwork.kernel.org/patch/10831319/
> I can send out v2 for this patchset, marking the dependency, if needed.

Ok, I added this patchset back to my queue. No need to resend.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
