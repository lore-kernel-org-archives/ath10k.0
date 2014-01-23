Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x234.google.com ([2a00:1450:4013:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6HlY-00045b-7w
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 10:44:08 +0000
Received: by mail-ea0-f180.google.com with SMTP id f15so331850eak.39
 for <ath10k@lists.infradead.org>; Thu, 23 Jan 2014 02:43:41 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 0/2] ath10k: add CSA support
Date: Thu, 23 Jan 2014 11:38:24 +0100
Message-Id: <1390473506-15677-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Hi,

This is a refactored and rewritten AP CSA patch
split into 2. As a bonus this fixes STA CSA as
well.


Michal Kazior (2):
  ath10k: implement channel switching
  ath10k: implement AP CSA

 drivers/net/wireless/ath/ath10k/core.h |  12 ++-
 drivers/net/wireless/ath/ath10k/mac.c  | 182 ++++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/wmi.c  |  11 ++
 3 files changed, 175 insertions(+), 30 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
