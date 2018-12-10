Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWQN4-0007Ta-Vu
 for ath10k@lists.infradead.org; Mon, 10 Dec 2018 18:33:57 +0000
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: [PATCH v3 0/3] ath10k: Add support to configure BB timing for
 external FEM
Date: Tue, 11 Dec 2018 00:01:28 +0530
Message-Id: <1544466691-11821-1-git-send-email-bperumal@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, Bhagavathi Perumal S <bperumal@codeaurora.org>

This adds support to choose correct Base Band(BB) timing values based on
the input Front End Module(FEM) hardware name from Device Tree entry and
configure it in hardware through WMI interface. Since the BB timing values
can vary between FEM hardwares and not same as default value used
in reference hardware.

Bhagavathi Perumal S (3):
  dt-bindings: net: ath10k: fix node name and device type in qcom ath10k
    example
  dt-bindings: net: ath10k: add new dt entry to identify external FEM
  ath10k: Add support to configure BB timing over wmi

v2:
 Addressed review comments in dt:
  * Fixed node name and device type with new dt patch "dt-bindings: net: ath10k:
     fix node name and device type in qcom ath10k example".
  * Changed the dt patch subject to "dt-bindings: net: ath10k: add new dt entry
    to identify external FEM".
  * Added new property in existing example.
  * Enumarated some valid FEM names.

v3:
 Addressed review comments in valid fem names.

 .../bindings/net/wireless/qcom,ath10k.txt          | 12 ++++--
 drivers/net/wireless/ath/ath10k/mac.c              | 47 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-ops.h          | 20 +++++++++
 drivers/net/wireless/ath/ath10k/wmi.c              | 23 +++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h              | 26 ++++++++++++
 5 files changed, 125 insertions(+), 3 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
