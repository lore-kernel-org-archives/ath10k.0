Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWSla-00045l-0O
 for ath10k@lists.infradead.org; Fri, 13 Mar 2015 16:48:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: move driver state check before setting throttle
References: <1426097094-6225-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Fri, 13 Mar 2015 18:48:21 +0200
In-Reply-To: <1426097094-6225-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Wed, 11 Mar 2015 23:34:54 +0530")
Message-ID: <873858rgh6.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Since thermal daemon is unaware of the device state, it might
> try to adjust the throttle state when the device is powered down.
> So the driver caches the value and will configure it while
> powering up the target. The cached value will be programed later
> once the device is brought up. In such case, returning error
> status is confusing and misleading the user application. Hence
> moving the driver state check before sending wmi command to target.
>
> Reported-by: Matthias Kaehlcke <mka@google.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

What tree do you use as the baseline? Three-way merge doesn't work as
sha1 ids are not found:

Applying: ath10k: move driver state check before setting throttle
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/thermal.c).
Repository lacks necessary blobs to fall back on 3-way merge.
Cannot fall back to three-way merge.
Patch failed at 0001 ath10k: move driver state check before setting throttle

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
