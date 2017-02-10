Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cc9V7-0004MR-Gz
 for ath10k@lists.infradead.org; Fri, 10 Feb 2017 11:36:31 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: Fix crash during rmmod when probe firmware
 fails
Date: Fri, 10 Feb 2017 11:36:04 +0000
Message-ID: <874m02i8hj.fsf@kamboji.qca.qualcomm.com>
References: <1482221351-24029-1-git-send-email-mohammed@qca.qualcomm.com>
 <8760l38dz0.fsf@kamboji.qca.qualcomm.com>
 <871svr8d83.fsf@kamboji.qca.qualcomm.com>
 <20170206100448.GA13894@atheros-ThinkPad-T61>
 <87lgteidii.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87lgteidii.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Fri, 10 Feb 2017 11:47:01 +0200")
Content-Language: en-US
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Shajakhan,
 Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> BTW, just curious but why do you have "during rmmod" in the title? I
> think I was able to reproduce this crash by removing all firmware files
> and didn't use rmmod at all.

Nevermind, I was blind again. It was my script which calls rmmod and I
failed to realise that. Sorry for the noise.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
