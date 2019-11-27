Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZzYP-0005yN-NO
 for ath10k@lists.infradead.org; Wed, 27 Nov 2019 15:48:35 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: move non-fatal warn logs to dbg level
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016ea2aee542-7e69e860-2ad6-4897-959f-e934f1a459bb-000000@us-west-2.amazonses.com>
References: <0101016ea2aee542-7e69e860-2ad6-4897-959f-e934f1a459bb-000000@us-west-2.amazonses.com>
Message-ID: <0101016ead8cb6e9-5c4cd3d9-9a7c-4fe8-bbbb-5a3a67a4b481-000000@us-west-2.amazonses.com>
Date: Wed, 27 Nov 2019 15:48:30 +0000
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> During driver load below warn logs are printed in the console if
> firmware doesn't support some optional HTC services, ex:pktlog.
> It is likely some older fw version may not support PKTLOG HTC
> service as legacy fw uses HTC DATA service  for pktlog.
> Move this log to debug level to remove un-necessary warn message
> on console.
> 
> htc.c:803:  ath10k_warn(ar, "unsupported HTC service id: %d\n",
> htc.c:881:  ath10k_warn(ar, "unsupported HTC service id: %d\n",
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ef39ac1b0d9f ath10k: move non-fatal warn logs to dbg level

-- 
https://patchwork.kernel.org/patch/11260371/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
