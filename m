Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaawK-0005Uz-K5
 for ath10k@lists.infradead.org; Fri, 29 Nov 2019 07:43:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: set WMI_PEER_AUTHORIZE after a firmware crash
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016eaadee57a-54500c6d-4751-423f-8bab-5acd8fad2175-000000@us-west-2.amazonses.com>
References: <0101016eaadee57a-54500c6d-4751-423f-8bab-5acd8fad2175-000000@us-west-2.amazonses.com>
Message-ID: <0101016eb61d95ae-7649e61b-4d0e-4e3d-93d1-37c138e4f461-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2019 07:43:42 +0000
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

> After the firmware crashes ath10k recovers via ieee80211_reconfig(),
> which eventually leads to firmware configuration and including the
> encryption keys. However, because there is no new auth/assoc and
> 4-way-handshake, and firmware set the authorize flag after
> 4-way-handshake, so the authorize flag in firmware is not set in
> firmware without 4-way-handshake. This will lead to a failure of data
> transmission after recovery done when using encrypted connections like
> WPA-PSK. Set authorize flag after installing keys to firmware will fix
> the issue.
> 
> This was noticed by testing firmware crashing using simulate_fw_crash
> debugfs file.
> 
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

382e51c139ef ath10k: set WMI_PEER_AUTHORIZE after a firmware crash

-- 
https://patchwork.kernel.org/patch/11263357/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
