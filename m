Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB0A4-0006IB-K5
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 16:19:38 +0000
Received: by mail-ot1-f65.google.com with SMTP id c23so11117059otl.9
 for <ath10k@lists.infradead.org>; Fri, 12 Oct 2018 09:19:26 -0700 (PDT)
Date: Fri, 12 Oct 2018 11:19:23 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/3] dt: bindings: add bindings for wifi iommu node
Message-ID: <20181012161923.GA28389@bogus>
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
 <1539172376-19269-4-git-send-email-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1539172376-19269-4-git-send-email-govinds@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, robh+dt@kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org

On Wed, 10 Oct 2018 17:22:56 +0530, Govind Singh wrote:
> WCN3990 wifi module can optionally make use of the IOMMU.
> Add binding documentation for phandle to the IOMMU and
> the stream id of wifi iommu block.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
