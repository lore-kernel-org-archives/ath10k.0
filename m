Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9g0z-0001Dy-BE
 for ath10k@lists.infradead.org; Tue, 09 Oct 2018 00:36:59 +0000
Received: by mail-pg1-x543.google.com with SMTP id t70-v6so8545823pgd.12
 for <ath10k@lists.infradead.org>; Mon, 08 Oct 2018 17:36:34 -0700 (PDT)
Date: Mon, 8 Oct 2018 17:36:30 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v5 0/6] *** Add support for wifi QMI client handshakes ***
Message-ID: <20181009003628.GA253926@ban.mtv.corp.google.com>
References: <20180815092637.11455-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180815092637.11455-1-govinds@codeaurora.org>
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
To: Govind Singh <govinds@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, niklas.cassel@linaro.org

+ linux-msm

Hi Govind, Kalle,

On Wed, Aug 15, 2018 at 02:56:31PM +0530, Govind Singh wrote:
> Add QMI client handshakes for Q6 integrated WLAN connectivity subsystem.
> This module is responsible for communicating WLAN control messages to FW
> over QMI interface. This patch series enables the qmi handshakes required for
> WCN3990 chipset.
[...]

What's the status of this patchset? It has seen various stages of
review, and except for the fact that Govind seems to have dropped
various Reviewed-by/Acked-by tags (which Rob noticed), I don't see any
relevant feedback that should be blocking it.

I previously had concerns about the firmware boot sequence -- that it
required a Qualcomm-specific TFTP service over QRTR, which had no open
source implementations. There is now a published daemon that worked for
me [1], as well as firmware releases that loaded modem and Wifi firmware
together, such that this TFTP service is not needed at all. So my
concerns there are no longer blocking.

And I think Rob already reviewed the relevant DT bindings (but again,
Govind missed collecting that tag for this series).

So the only outstanding request I see is to collect the appropriate
tags. Should Govind resend the whole series just for that?

FWIW, I've been using this series for a while now, and I reviewed
earlier versions. I can provide this for the whole series:

Reviewed-by: Brian Norris <briannorris@chromium.org>

If nothing else, I think it's important to get someone to merge the DT
bindings from this series, because Govind is now trying to extend the DT
binding and to enable the WCN3990 device node in the SDM845 device tree
nodes.

Regards,
Brian

[1] https://github.com/andersson/tqftpserv
[2] See this series:
    https://patchwork.kernel.org/cover/10621863/
    Govind didn't send it to the right mailing lists yet, but we're
    close...

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
