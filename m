Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcWxT-0002xa-Dl
 for ath10k@lists.infradead.org; Thu, 17 Sep 2015 11:02:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: move hw_scan worker queuing
References: <1441269825-344-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 17 Sep 2015 14:01:59 +0300
In-Reply-To: <1441269825-344-1-git-send-email-michal.kazior@tieto.com> (Michal
 Kazior's message of "Thu, 3 Sep 2015 10:43:45 +0200")
Message-ID: <878u85ux5k.fsf@kamboji.qca.qualcomm.com>
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

> The remain_on_channel callback needs different
> timeout. Calling ieee80211_queue_work() with a
> shorter delay after calling it with a longer delay
> will not change the timer. This caused the
> offchannel timeout worker to not trigger in time
> and caused the device to stay on channel longer
> then expected. This could cause some problems and
> was be easily reproduced with `iw offchannel`
> command.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
