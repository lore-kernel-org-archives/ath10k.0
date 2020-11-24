Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khh5n-0002xE-NH
 for ath10k@lists.infradead.org; Tue, 24 Nov 2020 22:47:24 +0000
Date: Tue, 24 Nov 2020 14:47:21 -0800
From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 1/2] soc: qcom: ipa: Constify static qmi structs
Message-ID: <20201124144721.3e80698c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201122234031.33432-2-rikard.falkeborn@gmail.com>
References: <20201122234031.33432-1-rikard.falkeborn@gmail.com>
 <20201122234031.33432-2-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
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
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc: Alex Elder <elder@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Mon, 23 Nov 2020 00:40:30 +0100 Rikard Falkeborn wrote:
> These are only used as input arguments to qmi_handle_init() which
> accepts const pointers to both qmi_ops and qmi_msg_handler. Make them
> const to allow the compiler to put them in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

I can take this one if Alex acks it.

The other patch is probably best handled by Kalle.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
