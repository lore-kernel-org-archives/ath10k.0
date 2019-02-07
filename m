Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grm6A-0001j4-BE
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 16:00:24 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: Assign 'n_cipher_suites = 11' for WCN3990 to
 enable WPA3
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1548339697-17766-2-git-send-email-aambure@codeaurora.org>
References: <1548339697-17766-2-git-send-email-aambure@codeaurora.org>
Message-Id: <20190207160021.9936260734@smtp.codeaurora.org>
Date: Thu,  7 Feb 2019 16:00:21 +0000 (UTC)
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
To: Abhishek Ambure <aambure@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Abhishek Ambure <aambure@codeaurora.org> wrote:

> Hostapd uses CCMP, GCMP & GCMP-256 as 'wpa_pairwise' option to run WPA3.
> In WCN3990 firmware cipher suite numbers 9 to 11 are for CCMP,
> GCMP & GCMP-256.
> 
> To enable CCMP, GCMP & GCMP-256 cipher suites in WCN3990 firmware,
> host sets 'n_cipher_suites = 11' while initializing hardware parameters.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This issued a new warning:

drivers/net/wireless/ath/ath10k/core.c:564:18: warning: Initializer entry defined twice
drivers/net/wireless/ath/ath10k/core.c:574:18:   also defined here

I fixed that in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=de1c369206cf48b73f74d5bf904ee26da485c84f

-- 
https://patchwork.kernel.org/patch/10779097/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
