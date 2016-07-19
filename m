Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPSKc-0004Uc-2z
 for ath10k@lists.infradead.org; Tue, 19 Jul 2016 10:32:55 +0000
Received: by mail-lf0-x234.google.com with SMTP id g62so10054015lfe.3
 for <ath10k@lists.infradead.org>; Tue, 19 Jul 2016 03:32:31 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/4] ath10k: fix spurious tx/rx during boot
Date: Tue, 19 Jul 2016 12:34:08 +0200
Message-Id: <1468924452-23877-1-git-send-email-michal.kazior@tieto.com>
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
To: kvalo@qca.qualcomm.com
Cc: marek.puzyniak@tieto.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Hi,

Recently Marek discovered the device transmits
"stuff" during device/driver boot.

The problem is related with the long known "no
channel" warning and it's a consequence of the
same bug - rx filters not being programmed
properly by firmware.

See last patch for more details.

I didn't do extensive testing but I can confirm
that I am no longer able to reroduce "no channel"
warnings and Marek tells me he no longer sees any
signal bumps on oscilloscope with his QCA9882.



Michal Kazior (4):
  ath10k: implement wmi echo command
  ath10k: implement wmi echo event
  ath10k: add wmi command barrier utility
  ath10k: fix spurious tx/rx during boot

 drivers/net/wireless/ath/ath10k/core.c    | 68 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h    |  1 +
 drivers/net/wireless/ath/ath10k/wmi-ops.h | 29 +++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 57 +++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c     | 83 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/wmi.h     |  5 ++
 6 files changed, 242 insertions(+), 1 deletion(-)

-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
