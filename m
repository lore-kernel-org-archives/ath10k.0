Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtWv2-0005Tp-Aa
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 07:21:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: embed supported chip ids in hw_params
References: <1416838646-18801-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 26 Nov 2014 09:21:16 +0200
In-Reply-To: <1416838646-18801-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 24 Nov 2014 15:17:24 +0100")
Message-ID: <87vbm2whoz.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This will make it easier to extend and maintain
> list of supported hardware.
>
> As a requirement this moves chip_id checking a
> little later because target_version isn't known
> until BMI can be queried.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

The reason why I originally added the chip_id check was that QCA988X hw
1.0 failed badly (ath10k might have even crashed, don't remember
anymore) and I added this chip_id as an ugly workaround to detect hw1.0
early. Most likely with this patch the problem comes back again.

I don't know what's a good solution, need to think more. Any ideas?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
