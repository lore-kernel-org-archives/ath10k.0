Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCOhx-0004rw-Ch
 for ath10k@lists.infradead.org; Thu, 01 Dec 2016 10:35:18 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: ath10k: Fix soft lockup during firmware crash/hw-restart
Date: Thu, 1 Dec 2016 10:34:50 +0000
Message-ID: <87mvggrl87.fsf@kamboji.qca.qualcomm.com>
References: <1480430762-15995-1-git-send-email-mohammed@qca.qualcomm.com>
 <1a44a3e9-3d67-30a5-0325-a65003ebe1fc@candelatech.com>
 <20161201060612.GA8611@atheros-ThinkPad-T61>
In-Reply-To: <20161201060612.GA8611@atheros-ThinkPad-T61> (Mohammed Shafi
 Shajakhan's message of "Thu, 1 Dec 2016 11:36:31 +0530")
Content-Language: en-US
Content-ID: <DA1E155190FE024F95893998DF689BD8@qualcomm.com>
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
To: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Cc: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Shajakhan,
 Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>

Mohammed Shafi Shajakhan <mohammed@codeaurora.org> writes:

> On Tue, Nov 29, 2016 at 10:16:50AM -0800, Ben Greear wrote:
>> Is this something for stable?  And if so, how far back should it be applied?
>
> @Kalle,
>
> [shafi] kindly suggest. If i am not wrong this is only needed for 4.9

Correct, commit 3c97f5de1f28 went to 4.9-rc1, it was not in 4.8. I'll
add CC stable to the commit log.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
