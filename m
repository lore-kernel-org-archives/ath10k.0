Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTSZo-000393-5f
 for ath10k@lists.infradead.org; Tue, 28 Apr 2020 15:55:17 +0000
Received: by mail-ot1-f67.google.com with SMTP id 72so33466187otu.1
 for <ath10k@lists.infradead.org>; Tue, 28 Apr 2020 08:55:15 -0700 (PDT)
Date: Tue, 28 Apr 2020 10:55:13 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: ath10k: Add wifi-firmware subnode
 for wifi node
Message-ID: <20200428155513.GA29618@bogus>
References: <1586971906-20985-1-git-send-email-pillair@codeaurora.org>
 <1586971906-20985-2-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586971906-20985-2-git-send-email-pillair@codeaurora.org>
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

On Wed, 15 Apr 2020 23:01:44 +0530, Rakesh Pillai wrote:
> Add a wifi-firmware subnode for the wifi node.
> This wifi-firmware subnode is needed for the
> targets which do not support TrustZone.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt       | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
