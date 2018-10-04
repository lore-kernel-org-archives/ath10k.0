Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g823g-0001ix-Oz
 for ath10k@lists.infradead.org; Thu, 04 Oct 2018 11:44:46 +0000
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: [PATCH 0/2] ath10k: Add support to configure BB timing for external
 FEM
Date: Thu,  4 Oct 2018 17:12:42 +0530
Message-Id: <1538653364-1239-1-git-send-email-bperumal@codeaurora.org>
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
To: ath10k@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, bperumal@codeaurora.org

This adds support to choose correct Base Band(BB) timing values based on
the input Front End Module(FEM) hardware name from Device Tree entry and
configure it in hardware through WMI interface. Since the BB timing values
can vary between FEM hardwares and not same as default value used
in reference hardware.

Bhagavathi Perumal S (2):
  dt: bindings: add new dt entry to indentify external FEM
  ath10k: Add support to configure BB timing over wmi

 .../bindings/net/wireless/qcom,ath10k.txt          | 22 ++++++++++
 drivers/net/wireless/ath/ath10k/mac.c              | 47 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-ops.h          | 20 +++++++++
 drivers/net/wireless/ath/ath10k/wmi.c              | 23 +++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h              | 26 ++++++++++++
 5 files changed, 138 insertions(+)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
