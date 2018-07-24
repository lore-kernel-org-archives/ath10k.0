Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-f68.google.com ([209.85.214.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fi6jH-0005IC-Mb
 for ath10k@lists.infradead.org; Tue, 24 Jul 2018 23:28:33 +0000
Received: by mail-it0-f68.google.com with SMTP id h23-v6so6172228ita.5
 for <ath10k@lists.infradead.org>; Tue, 24 Jul 2018 16:28:20 -0700 (PDT)
Date: Tue, 24 Jul 2018 17:28:18 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/6] dt: bindings: add bindings for msa memory region
Message-ID: <20180724232818.GA26318@rob-hp-laptop>
References: <20180723123428.12993-1-govinds@codeaurora.org>
 <20180723123428.12993-4-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180723123428.12993-4-govinds@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, niklas.cassel@linaro.org, andy.gross@linaro.org

On Mon, Jul 23, 2018 at 06:04:25PM +0530, Govind Singh wrote:
> Add device tree binding documentation details of msa
> memory region for ath10k qmi client for SDM845/APQ8098
> SoC into "qcom,ath10k.txt".
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt        | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
