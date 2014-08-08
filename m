Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFgWl-0005RM-Vj
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 09:32:00 +0000
Received: by mail-wi0-f179.google.com with SMTP id f8so689103wiw.12
 for <ath10k@lists.infradead.org>; Fri, 08 Aug 2014 02:31:35 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC 0/3] ath10k: ce fixes 2014-08-08
Date: Fri,  8 Aug 2014 11:22:12 +0200
Message-Id: <1407489735-28091-1-git-send-email-michal.kazior@tieto.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Ben Greear <greearb@candelatech.com>, Michal Kazior <michal.kazior@tieto.com>

Hi,

This removes implicit endianess in some places.
I'd love to get rid of it from
ath10k_pci_diag_access* as well but let's fix
ath10k_pci_diag_mem_* first.

@Kalle, @Ben: As far as I understand this
conflicts with fw dumping you work on so I'm
tentatively posting this as an RFC first.


Michal Kazior (3):
  ath10k: move pci init structures
  ath10k: dont duplicate service-pipe mapping
  ath10k: make target endianess more explicit

 drivers/net/wireless/ath/ath10k/pci.c | 410 +++++++++++++++++-----------------
 drivers/net/wireless/ath/ath10k/pci.h |  18 +-
 2 files changed, 210 insertions(+), 218 deletions(-)

-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
