Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anQIR-00017Q-Og
 for ath10k@lists.infradead.org; Tue, 05 Apr 2016 12:41:29 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: fix calibration init sequence of qca99x0
Date: Tue, 5 Apr 2016 12:40:57 +0000
Message-ID: <871t6kcjoo.fsf@kamboji.qca.qualcomm.com>
References: <1459352551-11773-1-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1459352551-11773-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Wed, 30 Mar 2016 21:12:29 +0530")
Content-Language: en-US
Content-ID: <024178742A4722429E405309DED502CE@qualcomm.com>
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

> pre-calibration is meant for qca4019 which contains only caldata
> whereas calibration file is used by ar9888 and qca99x0 that contains
> both board data and caldata. So by definition both pre-cal-file and
> cal-file can not coexist. Keeping them in shared memory (union), is
> breaking boot sequence of qca99x0. Fix it by storing both binaries
> in separate memories. This issue is reported in ipq8064 platform which
> includes caldata in flash memory.
>
> Reported-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

I added the fixes line in the pending branch:

Fixes: 3d9195ea19e4 ("ath10k: incorporate qca4019 cal data download sequence")

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
