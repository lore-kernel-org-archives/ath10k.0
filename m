Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e84yX-0004zp-5B
 for ath10k@lists.infradead.org; Fri, 27 Oct 2017 13:47:07 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: move ath10k_mac_tdls_vif*() functions
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1507183709-585-1-git-send-email-akolli@qti.qualcomm.com>
References: <1507183709-585-1-git-send-email-akolli@qti.qualcomm.com>
Message-ID: <d28440c53e574b58851d99003f99f9b9@euamsexm01a.eu.qualcomm.com>
Date: Fri, 27 Oct 2017 15:46:37 +0200
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
To: akolli@qti.qualcomm.com
Cc: akolli@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

akolli@qti.qualcomm.com wrote:

> To be able to use ath10k_mac_tdls_vif_stations_count() in
> ath10k_hw_scan() in the following patch, move the functions
> earlier in the file.
> 
> This commit is pure code move, no functional changes.
> 
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

2 patches applied to ath-next branch of ath.git, thanks.

dd0f9cd6bc6a ath10k: move ath10k_mac_tdls_vif*() functions
a60809313b96 ath10k: block offchannel operations if TDLS session is active

-- 
https://patchwork.kernel.org/patch/9986447/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
