Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1WRy-0002rZ-Jm
 for ath10k@lists.infradead.org; Tue, 11 Feb 2020 14:23:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2 1/2] dt-bindings: ath10k: Add new dt entries to identify
 coex support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1580152736-18654-1-git-send-email-tamizhr@codeaurora.org>
References: <1580152736-18654-1-git-send-email-tamizhr@codeaurora.org>
Message-Id: <20200211142326.598C9C4479C@smtp.codeaurora.org>
Date: Tue, 11 Feb 2020 14:23:26 +0000 (UTC)
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
To: Tamizh Chelvam <tamizhr@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Tamizh Chelvam <tamizhr@codeaurora.org> wrote:

> This adds new dt entries qcom,coexist-support and qcom,coexist-gpio-pin
> which will be used by ath10k driver to identify coex support
> of a hardware and notify wifi firmware the gpio pin number.
> This pin number information is needed for the hardware QCA4019.
> 
> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

7354de9c6e2c dt-bindings: ath10k: Add new dt entries to identify coex support
9f83993e1a92 ath10k: Add support to read btcoex related data from DT

-- 
https://patchwork.kernel.org/patch/11353153/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
