Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHPKu-0006u9-4z
 for ath10k@lists.infradead.org; Thu, 26 Mar 2020 10:02:07 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: enable radar detection in secondary segment
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1585158041-11740-1-git-send-email-ssreeela@codeaurora.org>
References: <1585158041-11740-1-git-send-email-ssreeela@codeaurora.org>
Message-Id: <20200326100139.5BC86C433BA@smtp.codeaurora.org>
Date: Thu, 26 Mar 2020 10:01:39 +0000 (UTC)
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
To: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
Cc: Lei Wang <leiwa@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sowmiya Sree Elavalagan <ssreeela@codeaurora.org> wrote:

> From: Lei Wang <leiwa@codeaurora.org>
> 
> Enable radar detection in secondary segment for VHT160 and VHT80+80 mode
> on DFS channels. Otherwise, when injecting radar pulse in the secondary
> segment, the DUT can't detect radar pulse.
> 
> Tested: qca9984 with firmware ver 10.4-3.10-00047
> 
> Signed-off-by: Lei Wang <leiwa@codeaurora.org>
> Signed-off-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>

Failed to apply:

error: patch failed: drivers/net/wireless/ath/ath10k/wmi.c:1717
error: drivers/net/wireless/ath/ath10k/wmi.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11458405/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
