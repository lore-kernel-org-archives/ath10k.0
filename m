Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSPfw-00036h-1Z
 for ath10k@lists.infradead.org; Fri, 22 Dec 2017 15:55:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v3 00/11] ath10k high latency
Date: Fri, 22 Dec 2017 15:55:40 +0000
Message-ID: <87r2rm92pw.fsf@kamboji.qca.qualcomm.com>
References: <20170917194013.8658-1-erik.stromdahl@gmail.com>
In-Reply-To: <20170917194013.8658-1-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Sun, 17 Sep 2017 21:40:02 +0200")
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> This is the third version of the high latency patches (stuff common for
> usb and sdio).

Sorry for the late review, this fall I have had difficulties to keep up
with all the patches. This set looks pretty good, I had few smaller
comments but nothing major really.

> One major difference between this version and the previous is that the
> num_pending_tx counter has been disabled for high latency devices (last patch).
>
> This fixes the previous issue with the halted USB RX.
> I have tested these patches with a Linksys WUSB6100M and it looks
> much better than the previous version.

I quickly tested this set few weeks ago on my test laptop and the kernel
was crashing a lot, I don't know was it because I usually try to run all
kernel debug features enabled or what. I don't have the logs at hand
right now. I think we should try to investigate that before adding the
hw_params entry for the usb device, but rest of the patches in this set
can go in even before. Most important is that we don't create any
regressions (including kernel crashes).

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
