Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBfzH-0003CI-O8
 for ath10k@lists.infradead.org; Thu, 15 Jan 2015 08:41:08 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21687.32167.596541.729136@gargle.gargle.HOWL>
Date: Thu, 15 Jan 2015 14:13:19 +0530
Subject: Re: [PATCH] ath10k: Make HTT fill size configurable
In-Reply-To: <87mw5kzbog.fsf@kamboji.qca.qualcomm.com>
References: <1420432796-10765-1-git-send-email-sujith@msujith.org>
 <87r3uy4t9y.fsf@kamboji.qca.qualcomm.com>
 <21685.35179.110539.780864@gargle.gargle.HOWL>
 <87bnm01ojf.fsf@kamboji.qca.qualcomm.com>
 <21687.29026.962216.812998@gargle.gargle.HOWL>
 <87vbk8zcr1.fsf@kamboji.qca.qualcomm.com>
 <21687.30578.746681.850817@gargle.gargle.HOWL>
 <87mw5kzbog.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo wrote:
> Yeah, but everyone want higher throughput (including me). So what value
> is best in your opinion?

Lower throughput has been okay for all this time, with a value
of 16. I suppose the value can be retained to not cause regressions
on AP135 or other platforms with a low-powered CPU. As Michal mentioned,
this value allows AP135 to function without the watchdog rebooting
the board.

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
