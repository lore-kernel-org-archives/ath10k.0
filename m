Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8Mtv-0004S8-JW
 for ath10k@lists.infradead.org; Tue, 17 Apr 2018 09:27:48 +0000
MIME-Version: 1.0
Date: Tue, 17 Apr 2018 14:57:36 +0530
From: pillair@codeaurora.org
Subject: Re: ath10k: Enable hw checksum for wcn3990
In-Reply-To: <20180416131652.E274C606AC@smtp.codeaurora.org>
References: <1522993544-15279-1-git-send-email-pillair@codeaurora.org>
 <20180416131652.E274C606AC@smtp.codeaurora.org>
Message-ID: <b82378df7d86887170e650305c6f224b@codeaurora.org>
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

The ath10k-check warning has been corrected and I have sent the v2 for 
the same.

Thanks,
Rakesh Pillai.

On 2018-04-16 18:46, Kalle Valo wrote:
> Rakesh Pillai <pillair@codeaurora.org> wrote:
> 
>> By default ath10k driver enables the support for HW_CHECKSUM
>> (NETIF_F_HW_CSUM). Since the TCP/UDP checksum calculation is not 
>> enabled
>> in the wcn3990 firmware the checksum is incorrect in the TCP/UDP 
>> packets
>> and all patckets are dropped. But due note that wcn3990 support in
>> ath10k is still incomplete so this isn't a critical fix (yet).
>> 
>> Enable hw checksum calculations in wcn3990 hardware by
>> setting the proper flags in msdu descriptor tso flags.
>> 
>> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 
> Introduces a new sparse warning:
> 
> potku:~/ath10k/src/ath$ ath10k-check
> drivers/net/wireless/ath/ath10k/htt_tx.c:1480:47: warning: invalid
> assignment: |=
> drivers/net/wireless/ath/ath10k/htt_tx.c:1480:47:    left side has
> type restricted __le32
> drivers/net/wireless/ath/ath10k/htt_tx.c:1480:47:    right side has
> type unsigned long
> 
> Patch set to Changes Requested.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
