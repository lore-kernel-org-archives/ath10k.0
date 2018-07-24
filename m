Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fi3qr-0002Md-Ds
 for ath10k@lists.infradead.org; Tue, 24 Jul 2018 20:24:10 +0000
Received: by mail-lj1-x244.google.com with SMTP id p6-v6so4723924ljc.5
 for <ath10k@lists.infradead.org>; Tue, 24 Jul 2018 13:23:57 -0700 (PDT)
Date: Tue, 24 Jul 2018 22:23:53 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v4 0/6] *** Add support for wifi QMI client handshakes ***
Message-ID: <20180724202353.GA14174@centauri.lan>
References: <20180723123428.12993-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180723123428.12993-1-govinds@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, andy.gross@linaro.org

On Mon, Jul 23, 2018 at 06:04:22PM +0530, Govind Singh wrote:
> Add QMI client handshakes for Q6 integrated WLAN connectivity subsystem.
> This module is responsible for communicating WLAN control messages to FW
> over QMI interface. This patch series enables the qmi handshakes required for
> WCN3990 chipset.
> 
> QUALCOMM MSM Interface(QMI) provides the control interface between
> components running b/w remote processors with underlying transport layer
> based on integrated chipset(shared memory) or discrete chipset(PCI/USB/SDIO/UART).
> 
> QMI client driver implementation is based on qmi framework https://lwn.net/Articles/729924/.

For whole series:

Acked-by: Niklas Cassel <niklas.cassel@linaro.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
