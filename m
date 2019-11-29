Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaau4-0004rG-6E
 for ath10k@lists.infradead.org; Fri, 29 Nov 2019 07:41:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: enable firmware log by default for sdio
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191108091914.16785-1-wgong@codeaurora.org>
References: <20191108091914.16785-1-wgong@codeaurora.org>
Message-ID: <0101016eb61b6da1-46ecac58-d77a-420d-a370-ad6da262cf89-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2019 07:41:21 +0000
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

Wen Gong <wgong@codeaurora.org> wrote:

> On SDIO chips the firmware log does not impact performance. To make it
> easier to debug firmware problems keep it enabled on the firmware.
> 
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7cbf4c96d715 ath10k: enable firmware log by default for sdio

-- 
https://patchwork.kernel.org/patch/11234367/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
