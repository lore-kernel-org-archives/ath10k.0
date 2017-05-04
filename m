Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d6GMI-0007Xv-MU
 for ath10k@lists.infradead.org; Thu, 04 May 2017 12:59:52 +0000
MIME-Version: 1.0
Subject: Re: [RESEND] ath10k: fix out of bounds access to local buffer
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20170424071157.6979-1-dev@michaelmera.com>
References: <20170424071157.6979-1-dev@michaelmera.com>
Message-ID: <afaf2e43f4d341e98650d6deb4b7769c@eusanexr01a.eu.qualcomm.com>
Date: Thu, 4 May 2017 05:59:26 -0700
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

Patch applied to ath-next branch of ath.git, thanks.

a16703aaeaed ath10k: fix out of bounds access to local buffer

-- 
https://patchwork.kernel.org/patch/9695703/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
