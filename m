Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fueyf-00050z-Gw
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 14:28:23 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: Support extended board data download for
 dual-band QCA9984
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180824141221.3661-1-murugana@codeaurora.org>
References: <20180824141221.3661-1-murugana@codeaurora.org>
Message-Id: <20180828142806.E453F6021C@smtp.codeaurora.org>
Date: Tue, 28 Aug 2018 14:28:06 +0000 (UTC)
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sathishkumar Muruganandam <murugana@codeaurora.org> wrote:

> Just moving functions down in the file, no functional changes.
> 
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Try to make the patch titles always unique, I changed this in pending branch
to:

    ath10k: refactoring needed for extended board data download

-- 
https://patchwork.kernel.org/patch/10575359/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
