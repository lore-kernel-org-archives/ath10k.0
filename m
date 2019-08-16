Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyjVh-0007Ce-QY
 for ath10k@lists.infradead.org; Fri, 16 Aug 2019 21:11:47 +0000
Received: by mail-oi1-f195.google.com with SMTP id v12so2121964oic.12
 for <ath10k@lists.infradead.org>; Fri, 16 Aug 2019 14:11:44 -0700 (PDT)
Date: Fri, 16 Aug 2019 16:11:41 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ath10k: Fix HOST capability QMI incompatibility
Message-ID: <20190816211141.GA4468@bogus>
References: <20190725063108.15790-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725063108.15790-1-bjorn.andersson@linaro.org>
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Wed, Jul 24, 2019 at 11:31:08PM -0700, Bjorn Andersson wrote:
> The introduction of 768ec4c012ac ("ath10k: update HOST capability QMI
> message") served the purpose of supporting the new and extended HOST
> capability QMI message.
> 
> But while the new message adds a slew of optional members it changes the
> data type of the "daemon_support" member, which means that older
> versions of the firmware will fail to decode the incoming request
> message.
> 
> There is no way to detect this breakage from Linux and there's no way to
> recover from sending the wrong message (i.e. we can't just try one
> format and then fallback to the other), so a quirk is introduced in
> DeviceTree to indicate to the driver that the firmware requires the 8bit
> version of this message.
> 
> Cc: stable@vger.kernel.org
> Fixes: 768ec4c012ac ("ath10k: update HOST capability qmi message")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt     |  6 +++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/net/wireless/ath/ath10k/qmi.c         | 13 ++++++++---
>  .../net/wireless/ath/ath10k/qmi_wlfw_v01.c    | 22 +++++++++++++++++++
>  .../net/wireless/ath/ath10k/qmi_wlfw_v01.h    |  1 +
>  drivers/net/wireless/ath/ath10k/snoc.c        | 11 ++++++++++
>  drivers/net/wireless/ath/ath10k/snoc.h        |  1 +
>  6 files changed, 51 insertions(+), 3 deletions(-)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
