Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smail.rz.tu-ilmenau.de ([141.24.186.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjKQD-00068o-KE
 for ath10k@lists.infradead.org; Thu, 11 Jun 2020 10:27:01 +0000
Subject: Re: [PATCH] ath10k: fix retry packets update in station dump
References: <1591856446-26977-1-git-send-email-vnaralas@codeaurora.org>
From: Markus Theil <markus.theil@tu-ilmenau.de>
Message-ID: <eaf47825-bf7a-e3aa-d0dc-42cf4aa5c9f1@tu-ilmenau.de>
Date: Thu, 11 Jun 2020 12:26:46 +0200
MIME-Version: 1.0
In-Reply-To: <1591856446-26977-1-git-send-email-vnaralas@codeaurora.org>
Content-Language: en-US
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 6/11/20 8:20 AM, Venkateswara Naralasetty wrote:
> When tx status enabled, retry count is updated from tx completion status.
> which is not working as expected due to firmware limitation where
> firmware can not provide per MSDU rate statistics from tx completion
> status. Due to this tx retry count is always 0 in station dump.
>
> Fix this issue by updating the retry packet count from per peer
> statistics. This patch will not break on SDIO devices since, this retry
> count is already updating from peer statistics for SDIO devices.
>
> HW used: QCA9984
> FW version: 10.4-3.6-00104

Thanks a lot for this patch! I tested it on the following HW, where it
also works.

HW: QCA9882
FW: 10.2.4-1.0-00047

Markus


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
