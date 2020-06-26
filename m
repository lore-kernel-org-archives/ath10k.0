Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1josff-000834-T9
 for ath10k@lists.infradead.org; Fri, 26 Jun 2020 18:01:52 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH 0/2] ath10k: Add chain-1 voltage regulator voting
Date: Fri, 26 Jun 2020 23:31:40 +0530
Message-Id: <1593194502-13164-1-git-send-email-pillair@codeaurora.org>
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
To: ath10k@lists.infradead.org, devicetree@vger.kernel.org
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

Add the support to vote for the chain-1
voltage regulator for WCN3990. This is
added as an optional property.

Rakesh Pillai (2):
  dt: bindings: Add new regulator as optional property for WCN3990
  ath10k: Add support for chain1 regulator supply voting

 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 4 +++-
 drivers/net/wireless/ath/ath10k/snoc.c                         | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
