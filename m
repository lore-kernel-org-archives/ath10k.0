Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPBfo-0000kw-0d
 for ath10k@lists.infradead.org; Tue, 11 Aug 2015 15:41:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: linux-4.1.y: ath10k: fix qca61x4 hw2.1 support
Date: Tue, 11 Aug 2015 18:40:15 +0300
Message-ID: <878u9hsujk.fsf@kamboji.qca.qualcomm.com>
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
To: stable@vger.kernel.org
Cc: ath10k@lists.infradead.org

Hi stable team,

please take the commit below to linux-4.1.y stable releases. It fixes a
long standing issue with qca61x4 hw2.1 support reported by multiple
users. This commit is already on 4.2 release. It will not apply to 4.0
or older, so take it only to 4.1.y branch.

commit 11a002efbaa7fbd9f6e616695ab42aa9f1caf060
Author: Michal Kazior <michal.kazior@tieto.com>
Date:   Mon Apr 20 09:20:41 2015 +0000

    ath10k: fix qca61x4 hw2.1 support

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
