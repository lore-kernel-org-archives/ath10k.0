Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCeSz-00088L-MH
 for ath10k@lists.infradead.org; Sat, 06 Apr 2019 06:06:21 +0000
Received: by mail-pl1-f194.google.com with SMTP id b3so4168841plr.7
 for <ath10k@lists.infradead.org>; Fri, 05 Apr 2019 23:06:13 -0700 (PDT)
Message-ID: <5ca841d3.1c69fb81.7ec38.ae4e@mx.google.com>
Date: Sat, 06 Apr 2019 01:06:10 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt: bindings: add dt entry for XO calibration
 support
References: <20190401091926.19119-1-govinds@codeaurora.org>
 <20190401091926.19119-2-govinds@codeaurora.org>
In-Reply-To: <20190401091926.19119-2-govinds@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Govind Singh <govinds@codeaurora.org>
Cc: robh@kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, devicetree@vger.kernel.org

On Mon,  1 Apr 2019 14:49:25 +0530, Govind Singh wrote:
> Add dt binding to get xo calibration data support for wifi rf clock.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
