Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqhqS-0000OM-3D
 for ath10k@lists.infradead.org; Thu, 25 Jul 2019 17:48:01 +0000
Received: by mail-pg1-x542.google.com with SMTP id f5so14578645pgu.5
 for <ath10k@lists.infradead.org>; Thu, 25 Jul 2019 10:47:59 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/3] ath10k: Clean up regulator and clock handling
Date: Thu, 25 Jul 2019 10:47:52 -0700
Message-Id: <20190725174755.23432-1-bjorn.andersson@linaro.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>, Govind Singh <govinds@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

The first patch in this series removes the regulator_set_voltage() of a fixed
voltate, as fixed regulator constraints should be specified on a board level
and on certain boards - such as the Lenovo Yoga C630 - the voltage specified
for the 3.3V regulator is outside the given range.

The following two patches cleans up regulator and clock usage by using the bulk
API provided by the two frameworks.

Bjorn Andersson (3):
  ath10k: snoc: skip regulator operations
  ath10k: Use standard regulator bulk API in snoc
  ath10k: Use standard bulk clock API in snoc

 drivers/net/wireless/ath/ath10k/snoc.c | 324 ++++---------------------
 drivers/net/wireless/ath/ath10k/snoc.h |  26 +-
 2 files changed, 48 insertions(+), 302 deletions(-)

-- 
2.18.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
