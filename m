Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av1kg-0004OE-Ua
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 12:06:06 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: release pre_cal_file while unloading driver
Date: Tue, 26 Apr 2016 12:05:26 +0000
Message-ID: <87inz4y3qy.fsf@kamboji.qca.qualcomm.com>
References: <1461660217-23046-1-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1461660217-23046-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Tue, 26 Apr 2016 14:13:37 +0530")
Content-Language: en-US
Content-ID: <2E96701BBEB29F4293219CAECF2C0DD6@qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "rmanohar@codeaurora.org" <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Failing to release pre_cal_file caldata on deinit causes memory leak.
>
> Fixes: b131129d9657 ("ath10k: fix calibration init sequence of qca99x0")
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Doesn't apply, please rebase.

Applying: ath10k: release pre_cal_file while unloading driver
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/core.c).
Repository lacks necessary blobs to fall back on 3-way merge.
Cannot fall back to three-way merge.
Patch failed at 0001 ath10k: release pre_cal_file while unloading driver

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
