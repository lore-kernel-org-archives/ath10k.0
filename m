Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2Ude-0005Cf-81
 for ath10k@lists.infradead.org; Thu, 12 Oct 2017 03:58:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix core PCI suspend when WoWLAN is supported but
 disabled
Date: Thu, 12 Oct 2017 03:58:00 +0000
Message-ID: <87y3ohow54.fsf@kamboji.qca.qualcomm.com>
References: <20170919232416.108247-1-briannorris@chromium.org>
 <20171012003805.GA89253@google.com>
In-Reply-To: <20171012003805.GA89253@google.com> (Brian Norris's message of
 "Wed, 11 Oct 2017 17:38:06 -0700")
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
To: Brian Norris <briannorris@chromium.org>
Cc: Ryan Hsu <ryanhsu@qti.qualcomm.com>, Grant Grundler <grundler@chromium.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>

Brian Norris <briannorris@chromium.org> writes:

> Ping? Any comments? I know there's more than one way to slice this
> problem, but it's most definitely a problem...

I'm lagging behind with patches but I'll try to catch up this week.
Sorry.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
