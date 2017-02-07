Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cb1rg-0001Wb-0e
 for ath10k@lists.infradead.org; Tue, 07 Feb 2017 09:15:08 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: remove ath10k_vif_to_arvif()
Date: Tue, 7 Feb 2017 09:14:42 +0000
Message-ID: <87y3xi4b28.fsf@qca.qualcomm.com>
References: <1486030773-30600-1-git-send-email-amadeusz.slawinski@tieto.com>
 <CAJ-VmonrHpS3MArM9ohHgLvb6xspP_gnVVeJWA9F-pjUpJ+LZA@mail.gmail.com>
In-Reply-To: <CAJ-VmonrHpS3MArM9ohHgLvb6xspP_gnVVeJWA9F-pjUpJ+LZA@mail.gmail.com>	(Adrian
 Chadd's message of "Thu, 2 Feb 2017 08:17:00 -0800")
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, =?iso-8859-2?Q?Amadeusz_S=B3awi=F1ski?= <amadeusz.slawinski@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Adrian Chadd <adrian@freebsd.org> writes:

> Removing this method makes the diff to FreeBSD larger, as "vif" in
> FreeBSD is a different pointer.
>
> (Yes, I have ath10k on freebsd working and I'd like to find a way to
> reduce the diff moving forward.)

I don't like this "(void *) vif->drv_priv" style that much either but
apparently it's commonly used in Linux wireless code and already parts
of ath10k. So this patch just unifies the coding style.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
