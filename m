Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnOMf-00040F-H4
 for ath10k@lists.infradead.org; Thu, 31 Aug 2017 12:14:31 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix napi_poll budget overflow
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1503438242-5657-1-git-send-email-ryanhsu@qti.qualcomm.com>
References: <1503438242-5657-1-git-send-email-ryanhsu@qti.qualcomm.com>
Message-ID: <b71aea953f7243498dbe97b0bd5473f7@euamsexm01a.eu.qualcomm.com>
Date: Thu, 31 Aug 2017 14:13:54 +0200
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
To: ryanhsu@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

ryanhsu@qti.qualcomm.com wrote:

> In napi_poll, the budget number is used to control the amount of packets
> we should handle per poll to balance the resource in the system.
> 
> In the list of the amsdu packets reception, we check if there is budget
> count left and handle the complete list of the packets, that it will have
> chances the very last list will over the budget leftover.
> 
> So adding one more parameter - budget_left, this would help while
> traversing the list to avoid handling more than the budget given.
> 
> Reported-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Fix-suggested-by: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>
> Link: https://lkml.kernel.org/r/26670dce-4dd2-f8e4-0e14-90d74257e739@virtuozzo.com
> Signed-off-by: Ryan Hsu <ryanhsu@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

c9353bf483d3 ath10k: fix napi_poll budget overflow

-- 
https://patchwork.kernel.org/patch/9916207/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
