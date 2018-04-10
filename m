Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5uD5-0004Vq-FR
 for ath10k@lists.infradead.org; Tue, 10 Apr 2018 14:25:25 +0000
MIME-Version: 1.0
Subject: Re: [v2,13/13] dt: bindings: add bindings for wcn3990 wifi block
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1521781424-24972-14-git-send-email-govinds@codeaurora.org>
References: <1521781424-24972-14-git-send-email-govinds@codeaurora.org>
Message-Id: <20180410142513.33C4D6076A@smtp.codeaurora.org>
Date: Tue, 10 Apr 2018 14:25:13 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> Add device tree binding documentation details for wcn3990
> wifi block present in Qualcomm SDM845/APQ8098 SoC into
> "qcom,ath10k.txt".
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Govind, you forgot to CC devicetree list. I was wondering why there's no ack
from device tree maintainers and realised only now that they were not CCed.

Please resubmit this patch unmodified (no need to resubmit others) and CC also
devicetree list. Hopefully we get an ack from them and I can finally apply this
patchset.

-- 
https://patchwork.kernel.org/patch/10302683/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
