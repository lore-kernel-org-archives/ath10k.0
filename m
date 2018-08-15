Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-f67.google.com ([209.85.214.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fpyHU-0005A9-Ce
 for ath10k@lists.infradead.org; Wed, 15 Aug 2018 16:04:21 +0000
Received: by mail-it0-f67.google.com with SMTP id d10-v6so2367359itj.5
 for <ath10k@lists.infradead.org>; Wed, 15 Aug 2018 09:04:10 -0700 (PDT)
Date: Wed, 15 Aug 2018 10:04:07 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 3/6] dt: bindings: add bindings for msa memory region
Message-ID: <20180815160407.GA12553@rob-hp-laptop>
References: <20180815092637.11455-1-govinds@codeaurora.org>
 <20180815092637.11455-4-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180815092637.11455-4-govinds@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, niklas.cassel@linaro.org

On Wed, Aug 15, 2018 at 02:56:34PM +0530, Govind Singh wrote:
> Add device tree binding documentation details of msa
> memory region for ath10k qmi client for SDM845/APQ8098
> SoC into "qcom,ath10k.txt".
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt        | 6 ++++++
>  1 file changed, 6 insertions(+)

Please add acks/reviewed-bys when posting new versions.

Rob

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
