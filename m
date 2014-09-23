Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWRF0-0001j3-55
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 14:38:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ath10k: don't enable interrupts for the diagnostic
 window
In-Reply-To: <20140923143219.23585.34114.stgit@potku.adurom.net> (Kalle Valo's
 message of "Tue, 23 Sep 2014 17:32:19 +0300")
References: <20140923143219.23585.34114.stgit@potku.adurom.net>
Date: Tue, 23 Sep 2014 17:38:27 +0300
Message-ID: <87d2amcsgs.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Hi,

I forgot add --edit-cover to stg. So here's the cover letter :)

ath10k: export calibration data to user space

here's a small patchset exporting firmware calibration data to user space. This
makes it easier to debug various calibration data related problems.

Please comment.

v2:

* never unmask the diagnostic window copy engine pipe in
  ath10k_ce_enable_interrupts()

* add locking for diag_read_mem()/diag_write_mem()

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
