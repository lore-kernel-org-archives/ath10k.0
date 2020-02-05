Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izOnZ-00030m-Ux
 for ath10k@lists.infradead.org; Wed, 05 Feb 2020 17:49:15 +0000
Received: by mail-wm1-f66.google.com with SMTP id t14so3874699wmi.5
 for <ath10k@lists.infradead.org>; Wed, 05 Feb 2020 09:49:13 -0800 (PST)
Date: Wed, 5 Feb 2020 17:49:10 +0000
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 1/2] dt-bindings: ath10k: Add new dt entries to
 identify coex support
Message-ID: <20200205174910.GA29218@bogus>
References: <1580152736-18654-1-git-send-email-tamizhr@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580152736-18654-1-git-send-email-tamizhr@codeaurora.org>
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

On Tue, 28 Jan 2020 00:48:55 +0530, Tamizh Chelvam wrote:
> This adds new dt entries qcom,coexist-support and qcom,coexist-gpio-pin
> which will be used by ath10k driver to identify coex support
> of a hardware and notify wifi firmware the gpio pin number.
> This pin number information is needed for the hardware QCA4019.
> 
> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
