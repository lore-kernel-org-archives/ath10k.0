Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hphux-0001wA-AS
 for ath10k@lists.infradead.org; Mon, 22 Jul 2019 23:40:32 +0000
Received: by mail-io1-f68.google.com with SMTP id q22so77864389iog.4
 for <ath10k@lists.infradead.org>; Mon, 22 Jul 2019 16:40:30 -0700 (PDT)
Date: Mon, 22 Jul 2019 17:40:28 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt: bindings: update compatible dt properties for
 WCN3990 wifi node
Message-ID: <20190722234028.GA9986@bogus>
References: <20190703035711.25592-1-govinds@codeaurora.org>
 <20190703035711.25592-2-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703035711.25592-2-govinds@codeaurora.org>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, devicetree@vger.kernel.org

On Wed,  3 Jul 2019 09:27:09 +0530, Govind Singh wrote:
> update compatible dt properties for WCN3990 wifi node to be
> compatible across different MSM platforms.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
