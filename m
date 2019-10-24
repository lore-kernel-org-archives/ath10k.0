Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNZhz-0001wr-Sf
 for ath10k@lists.infradead.org; Thu, 24 Oct 2019 09:47:09 +0000
MIME-Version: 1.0
Date: Thu, 24 Oct 2019 17:47:05 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v6 2/3] ath10k: change max RX bundle size from 8 to 32 for
 sdio
In-Reply-To: <87mudqsd6d.fsf@kamboji.qca.qualcomm.com>
References: <1569402639-31720-1-git-send-email-wgong@codeaurora.org>
 <1569402639-31720-3-git-send-email-wgong@codeaurora.org>
 <87mudqsd6d.fsf@kamboji.qca.qualcomm.com>
Message-ID: <200eef83925da532e49565bcf4f9ffc1@codeaurora.org>
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

On 2019-10-24 17:30, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> writes:
> 
>> The max bundle size support by firmware is 32, change it from 8 to 32
>> will help performance. This results in significant performance
>> improvement on RX path.
>> 
>> Tested with QCA6174 SDIO with firmware
>> WLAN.RMH.4.4.1-00017-QCARMSWPZ-1
>> 
>> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> 
> [...]
> 
>> --- a/drivers/net/wireless/ath/ath10k/sdio.c
>> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
>> @@ -24,7 +24,7 @@
>>  #include "trace.h"
>>  #include "sdio.h"
>> 
>> -#define ATH10K_SDIO_VSG_BUF_SIZE	(32 * 1024)
>> +#define ATH10K_SDIO_VSG_BUF_SIZE	(64 * 1024)
> 
> Is allocating 64 kb with kmalloc() reliable, especially on smaller
> systems? I hope it is, but checking if someone else knows better. We
> only do this only once in probe(), though.
rx packet is more than 1500 bytes for performance test, so for 32 
packets, 32*1024 is not enough.
yes, it is allocated only one time for probe.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
