Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y5vrJ-00087P-Ct
 for ath10k@lists.infradead.org; Tue, 30 Dec 2014 12:25:10 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: [PATCH 0/4] ath10k: a few incorrect return handling fix-up
Date: Tue, 30 Dec 2014 07:20:42 -0500
Message-Id: <1419942046-17985-1-git-send-email-der.herr@hofr.at>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Nicholas Mc Guire <der.herr@hofr.at>, Michal Kazior <michal.kazior@tieto.com>, Yanbo Li <yanbol@qti.qualcomm.com>, Ben Greear <greearb@candelatech.com>

wait_for_completion_timeout does not return negative values so the tests
for <= 0 are not needed and the case differentiation in the error handling
path unnecessary.

patch was only compile tested x86_64_defconfig + CONFIG_ATH_CARDS=m
CONFIG_ATH10K=m

patch is against linux-next 3.19.0-rc1 -next-20141226

None of the proposed cleanups are critical.
All changes should only be removing unreachable cases.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
