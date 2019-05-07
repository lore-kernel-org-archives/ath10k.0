Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO0fY-0007ts-IW
 for ath10k@lists.infradead.org; Tue, 07 May 2019 14:02:13 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath10k: Add wmi tlv vdev subtype for mesh in WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1555489907-30117-2-git-send-email-svishnoi@codeaurora.org>
References: <1555489907-30117-2-git-send-email-svishnoi@codeaurora.org>
Message-Id: <20190507140207.D214060350@smtp.codeaurora.org>
Date: Tue,  7 May 2019 14:02:07 +0000 (UTC)
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
To: Surabhi Vishnoi <svishnoi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Surabhi Vishnoi <svishnoi@codeaurora.org> wrote:

> There is a disparity in wmi and wmi tlv vdev subtype
> enum for WMI_VDEV_SUBTYPE_MESH_11S.
> 
> Add different enum for wmi tlv vdev subtype to support
> vdev of subtype mesh 11s for WCN3990.
> 
> Tested HW: WCN3990
> 
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

a7368c395fc3 ath10k: Add wmi tlv vdev subtype for mesh in WCN3990
97354f2c4327 ath10k: Do not send probe response template for mesh
7835d8f8792d ath10k: Add wmi tlv service map for mesh 11s

-- 
https://patchwork.kernel.org/patch/10904959/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
