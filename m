Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgyyF-00071I-6A
 for ath10k@lists.infradead.org; Sun, 22 Nov 2020 23:40:40 +0000
Received: by mail-lj1-x244.google.com with SMTP id p12so16056474ljc.9
 for <ath10k@lists.infradead.org>; Sun, 22 Nov 2020 15:40:37 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH net-next 0/2] net: Constify static qmi structs
Date: Mon, 23 Nov 2020 00:40:29 +0100
Message-Id: <20201122234031.33432-1-rikard.falkeborn@gmail.com>
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
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Alex Elder <elder@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>, Kalle Valo <kvalo@codeaurora.org>

Constify a couple of static qmi_ops and qmi_msg_handler structs that are
never modified. 

Rikard Falkeborn (2):
  soc: qcom: ipa: Constify static qmi structs
  ath10k: Constify static qmi structs

 drivers/net/ipa/ipa_qmi.c             | 8 ++++----
 drivers/net/wireless/ath/ath10k/qmi.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.29.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
