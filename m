Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8TFq-0004qc-Vv
 for ath10k@lists.infradead.org; Thu, 12 Sep 2019 17:51:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 0/8] ath10k: improve throughout of tcp/udp TX/RX of sdio
References: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
 <87tv9hikwe.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 12 Sep 2019 20:51:32 +0300
In-Reply-To: <87tv9hikwe.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Thu, 12 Sep 2019 18:39:29 +0300")
Message-ID: <87d0g5h07v.fsf@kamboji.qca.qualcomm.com>
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
>> The bottleneck of throughout on sdio chip is the bus bandwidth, to the
>> patches are all to increase the use ratio of sdio bus.
>>
>>                       udp-rx    udp-tx    tcp-rx    tcp-tx
>> without patches(Mbps)  320        180       170       151
>> with patches(Mbps)     450        410       400       320
>>
>> These patches only affect sdio bus chip, explanation is mentioned in each
>> patch's commit log.
>
> I tried to apply patches 2-8, patch 2 had a conflict due to my changes
> and patch 8 didn't apply at all. Also I saw few warnings with the
> patches I was able to test:
>
> $ ath10k-check
> drivers/net/wireless/ath/ath10k/htc.c: In function 'ath10k_htc_bundle_tx_work':
> drivers/net/wireless/ath/ath10k/htc.c:796:24: warning: variable 'eid'
> set but not used [-Wunused-but-set-variable]
> drivers/net/wireless/ath/ath10k/sdio.c:2169:6: warning: no previous
> prototype for 'ath10k_sdio_check_fw_reg' [-Wmissing-prototypes]
> drivers/net/wireless/ath/ath10k/sdio.c: In function 'ath10k_sdio_check_fw_reg':
> drivers/net/wireless/ath/ath10k/sdio.c:2171:6: warning: variable 'ret'
> set but not used [-Wunused-but-set-variable]
> drivers/net/wireless/ath/ath10k/sdio.c: In function 'ath10k_sdio_fw_crashed_dump':
> drivers/net/wireless/ath/ath10k/sdio.c:2434:17: warning: too many
> arguments for format [-Wformat-extra-args]
> drivers/net/wireless/ath/ath10k/sdio.c:2169:6: warning: symbol
> 'ath10k_sdio_check_fw_reg' was not declared. Should it be static?
> drivers/net/wireless/ath/ath10k/sdio.c: In function 'ath10k_sdio_fw_crashed_dump':
> drivers/net/wireless/ath/ath10k/sdio.c:2434:17: warning: too many
> arguments for format [-Wformat-extra-args]
> drivers/net/wireless/ath/ath10k/sdio.c:734: braces {} are not
> necessary for single statement blocks
> drivers/net/wireless/ath/ath10k/sdio.c:969: braces {} are not
> necessary for single statement blocks

Actually some of the warnings are from another patch.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
