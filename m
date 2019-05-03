Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMS7V-0004Hm-SF
 for ath10k@lists.infradead.org; Fri, 03 May 2019 06:56:35 +0000
MIME-Version: 1.0
Date: Fri, 03 May 2019 12:26:31 +0530
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: Re: [PATCH 1/2] ath10k: Fix rate table updation in tx stats
In-Reply-To: <20190503060032.23F1C61195@smtp.codeaurora.org>
References: <1552319602-17795-2-git-send-email-pillair@codeaurora.org>
 <20190503060032.23F1C61195@smtp.codeaurora.org>
Message-ID: <edfbff30627849996b0597b964ed018c@codeaurora.org>
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

Hi Kalle,

This set of patches is dependent on 
https://patchwork.kernel.org/patch/10831319/
I can send out v2 for this patchset, marking the dependency, if needed.

Thanks,
Rakesh Pillai.


On 2019-05-03 11:30, Kalle Valo wrote:
> Rakesh Pillai <pillair@codeaurora.org> wrote:
> 
>> The index for updating rate table, which is displayed
>> in the tx stats via debugfs, is calculated using the
>> bandwidth value. The bandwidth values do not map
>> correctly with the bandwidth values shown in the rate table.
>> 
>> Correct the bandwidth value calculation which is used
>> to calculate the index for rate table updation for tx stats.
>> 
>> Tested HW: WCN3990
>> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
>> 
>> Fixes: e88975ca37d1 ("ath10k: dump tx stats in rate table format")
>> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> 
> Fails to compile:
> 
> drivers/net/wireless/ath/ath10k/htt_rx.c: In function
> 'ath10k_accumulate_per_peer_tx_stats':
> drivers/net/wireless/ath/ath10k/htt_rx.c:3252:14: error: implicit
> declaration of function 'ath10k_get_bw'; did you mean
> 'ath10k_get_tid'? [-Werror=implicit-function-declaration]
>   rtable_bw = ath10k_get_bw(&ar->hw_params, pstats->flags);
>               ^~~~~~~~~~~~~
>               ath10k_get_tid
> cc1: some warnings being treated as errors
> make[5]: *** [drivers/net/wireless/ath/ath10k/htt_rx.o] Error 1
> make[4]: *** [drivers/net/wireless/ath/ath10k] Error 2
> make[3]: *** [drivers/net/wireless/ath] Error 2
> make[2]: *** [drivers/net/wireless] Error 2
> make[1]: *** [drivers/net] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [drivers] Error 2
> 
> 2 patches set to Changes Requested.
> 
> 10847733 [1/2] ath10k: Fix rate table updation in tx stats
> 10847737 [2/2] ath10k: Fix NSS tx stats for legacy rates

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
