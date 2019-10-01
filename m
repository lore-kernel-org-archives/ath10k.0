Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFGAX-0006gY-7k
 for ath10k@lists.infradead.org; Tue, 01 Oct 2019 11:18:14 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: fix IRAM addr in coredump
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1569505021-20515-1-git-send-email-akolli@codeaurora.org>
References: <1569505021-20515-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20191001111812.E3E836053D@smtp.codeaurora.org>
Date: Tue,  1 Oct 2019 11:18:12 +0000 (UTC)
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> The IRAM start address in coredump was wrong for QCA9984, QCA4019, QCA9888 and
> QCA99x0.
> 
> Tested on: QCA9984, QCA4019
> FW version: 10.4-3.9.0.2-00044
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

93f9fefcf528 ath10k: coredump: fix IRAM addr for QCA9984, QCA4019, QCA9888 and QCA99x0
d98ddae85a4a ath10k: fix backtrace on coredump

-- 
https://patchwork.kernel.org/patch/11162763/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
