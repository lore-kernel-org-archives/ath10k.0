Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFWPN-00077A-4v
 for ath10k@lists.infradead.org; Tue, 08 Sep 2020 05:43:10 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt: bindings: Add new regulator as optional property
 for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1593194502-13164-2-git-send-email-pillair@codeaurora.org>
References: <1593194502-13164-2-git-send-email-pillair@codeaurora.org>
Message-ID: <010101746c3d3779-d1a7a5c2-a80b-4b5f-aeb6-4fec42c56910-000000@us-west-2.amazonses.com>
Date: Tue, 8 Sep 2020 05:43:05 +0000
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

> Add an additional regulator supply as an optional
> property for WCN3990.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

8f1553694551 dt: bindings: Add new regulator as optional property for WCN3990
9e69fe31ca9a ath10k: Add support for chain1 regulator supply voting

-- 
https://patchwork.kernel.org/patch/11628309/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
