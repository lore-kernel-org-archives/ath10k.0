Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBftw-0000F7-DC
 for ath10k@lists.infradead.org; Thu, 15 Jan 2015 08:35:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Make HTT fill size configurable
References: <1420432796-10765-1-git-send-email-sujith@msujith.org>
 <87r3uy4t9y.fsf@kamboji.qca.qualcomm.com>
 <21685.35179.110539.780864@gargle.gargle.HOWL>
 <87bnm01ojf.fsf@kamboji.qca.qualcomm.com>
 <21687.29026.962216.812998@gargle.gargle.HOWL>
 <87vbk8zcr1.fsf@kamboji.qca.qualcomm.com>
 <21687.30578.746681.850817@gargle.gargle.HOWL>
 <21687.30881.260644.741211@gargle.gargle.HOWL>
Date: Thu, 15 Jan 2015 10:35:02 +0200
In-Reply-To: <21687.30881.260644.741211@gargle.gargle.HOWL> (Sujith
 Manoharan's message of "Thu, 15 Jan 2015 13:51:53 +0530")
Message-ID: <87iog8zbk9.fsf@kamboji.qca.qualcomm.com>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sujith Manoharan <sujith@msujith.org> writes:

> Sujith Manoharan wrote:
>> None. The default stays the same. But, it can be adjusted based
>> on the platform, if higher throughput is desired.
>
> But, anyway, this patch can be dropped. We'll change the fill level
> restriction internally, based on the customer's platform.

I'm sad to hear that, now others cannot benefit from your work.

What was wrong with my proposal? Would it help if I write an RFC patch?
Just tell me what HTT fill value I should use.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
