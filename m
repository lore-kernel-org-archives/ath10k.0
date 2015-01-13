Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB2mF-0000ng-Aa
 for ath10k@lists.infradead.org; Tue, 13 Jan 2015 14:49:03 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Make HTT fill size configurable
References: <1420432796-10765-1-git-send-email-sujith@msujith.org>
 <CA+BoTQ=HqF0vBj4chXfoY9GKcFBP8Xh37HXo5etDDZ1XCg6O4w@mail.gmail.com>
 <54AD103B.40002@qti.qualcomm.com>
Date: Tue, 13 Jan 2015 16:48:29 +0200
In-Reply-To: <54AD103B.40002@qti.qualcomm.com> (Vasanthakumar Thiagarajan's
 message of "Wed, 7 Jan 2015 16:23:47 +0530")
Message-ID: <87vbka4tz6.fsf@kamboji.qca.qualcomm.com>
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: Sujith Manoharan <sujith@msujith.org>, linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:

>>> This patch adds a module parameter to adjust the fill size
>>> based on the platform/usage.
>>
>> I don't think this should be adjustable.
>
> Default value of 16 causes rx ring corruption within 1 hour of stress
> testing. Increasing this limit to 1000 solves the issue, not sure what
> max value in > 16 and <= 1000 works.

Does the patch below fix that issue? Or is this issue still open?

5de6dfc82f71 ath10k: Fix potential Rx ring corruption

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
