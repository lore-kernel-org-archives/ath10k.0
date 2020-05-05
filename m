Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVs89-00086X-W2
 for ath10k@lists.infradead.org; Tue, 05 May 2020 07:36:44 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/3] dt-bindings: ath10k: Add wifi-firmware subnode for
 wifi node
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1586971906-20985-2-git-send-email-pillair@codeaurora.org>
References: <1586971906-20985-2-git-send-email-pillair@codeaurora.org>
Message-Id: <20200505073625.1F1B5C433BA@smtp.codeaurora.org>
Date: Tue,  5 May 2020 07:36:25 +0000 (UTC)
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> Add a wifi-firmware subnode for the wifi node.
> This wifi-firmware subnode is needed for the
> targets which do not support TrustZone.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

85325c24d5d2 dt-bindings: ath10k: Add wifi-firmware subnode for wifi node
727fec790ead ath10k: Setup the msa resources before qmi init
1423f4327331 ath10k: Add support for targets without trustzone

-- 
https://patchwork.kernel.org/patch/11491759/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
