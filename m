Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmft7-0005mC-0o
 for ath10k@lists.infradead.org; Thu, 24 Jan 2019 14:21:50 +0000
From: Abhishek Ambure <aambure@codeaurora.org>
Subject: [PATCH 0/2] Enable WPA3 cipher suites in WCN3990 firmware
Date: Thu, 24 Jan 2019 19:51:35 +0530
Message-Id: <1548339697-17766-1-git-send-email-aambure@codeaurora.org>
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
Cc: Abhishek Ambure <aambure@codeaurora.org>, linux-wireless@vger.kernel.org

This patchset brings changes to enable CCMP, GCMP & GCMP-256 cipher suites to run WPA3 security protocol in WCN3990. TLV based firmwares ex. QCA6174,
WCN3990 and non-TLV based firmwares have differnet mapping for GCMP &
GCMP-256 cipher suites.
Cipher suites mapping in host driver is done according to wmi tlv and non-tlv versions of firmware.

Abhishek Ambure (2):
  ath10k: Assign 'n_cipher_suites = 11' for WCN3990 to enable WPA3
  ath10k: Update GCMP & GCMP-256 cipher suite number for WCN3990

 drivers/net/wireless/ath/ath10k/core.c    |  1 +
 drivers/net/wireless/ath/ath10k/core.h    |  1 +
 drivers/net/wireless/ath/ath10k/mac.c     | 12 +++++------
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  6 ++++--
 drivers/net/wireless/ath/ath10k/wmi.c     | 30 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h     | 33 ++++++++++++++++++++++---------
 6 files changed, 66 insertions(+), 17 deletions(-)

-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
