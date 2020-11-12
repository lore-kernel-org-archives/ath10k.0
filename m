Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdIul-0005sN-3O
 for ath10k@lists.infradead.org; Thu, 12 Nov 2020 20:09:51 +0000
Received: by mail-pg1-x52d.google.com with SMTP id r186so5168138pgr.0
 for <ath10k@lists.infradead.org>; Thu, 12 Nov 2020 12:09:48 -0800 (PST)
From: Abhishek Kumar <kuabhs@chromium.org>
Subject: [PATCH v2 0/1] This patch address comments on patch v1
Date: Thu, 12 Nov 2020 20:09:05 +0000
Message-Id: <20201112200906.991086-1-kuabhs@chromium.org>
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
To: kvalo@codeaurora.org, pillair@codeaurora.org
Cc: Abhishek Kumar <kuabhs@chromium.org>, netdev@vger.kernel.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, dianders@chromium.org, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

This patch extends ath10k_core_create_board_name function to support chip id
based BDF selection and not add provision for fallback_boardname2, thus
introducing lesser lines of code.

(no changes since v1)

Abhishek Kumar (1):
  ath10k: add option for chip-id based BDF selection

 drivers/net/wireless/ath/ath10k/core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.29.2.222.g5d2a92d10f8-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
