Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3JX9-0002nA-E4
 for ath10k@lists.infradead.org; Wed, 26 Apr 2017 09:46:53 +0000
MIME-Version: 1.0
Subject: Re: [RESEND] ath10k: fix out of bounds access to local buffer
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20170424071157.6979-1-dev@michaelmera.com>
References: <20170424071157.6979-1-dev@michaelmera.com>
Message-ID: <0a7aa133740b4488a19bd95115831988@euamsexm01a.eu.qualcomm.com>
Date: Wed, 26 Apr 2017 11:46:22 +0200
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
To: Michael Mera <dev@michaelmera.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michael Mera <dev@michaelmera.com> wrote:
> During write to debugfs file simulate_fw_crash, fixed-size local buffer
> 'buf' is accessed and modified at index 'count-1', where 'count' is the
> size of the write (so potentially out of bounds).
> This patch fixes this problem.
> 
> Signed-off-by: Michael Mera <dev@michaelmera.com>

I fixed a checkpatch warning in the pending branch:

drivers/net/wireless/ath/ath10k/debug.c:636: spaces preferred around that '-' (ctx:VxV)

-- 
https://patchwork.kernel.org/patch/9695703/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
