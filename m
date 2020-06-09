Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jict4-0003dU-9s
 for ath10k@lists.infradead.org; Tue, 09 Jun 2020 11:57:55 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: enable advertising support for channels 32,
 68 and 98
References: <20200327093147.189390-1-robert.marko@sartura.hr>
Date: Tue, 09 Jun 2020 14:57:39 +0300
In-Reply-To: <20200327093147.189390-1-robert.marko@sartura.hr> (Robert Marko's
 message of "Fri, 27 Mar 2020 10:31:47 +0100")
Message-ID: <87y2owmoy4.fsf@codeaurora.org>
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
To: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>, ath10k@lists.infradead.org

Robert Marko <robert.marko@sartura.hr> writes:

> Enable advertising support for 5G channels: 32, 68 and 96.
> These channels are legal and available for use in ETSI countries.
> So lets advertise these and they will be available in accordance with the regulatory domain used.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>

What's the use case for this? I was told that the IEEE standard does not
define these channels, that's why I'm asking for more information.

On what hardware and firmware did you test this? It might be that not
all hardware or firmware support this.

There was a concern if this slows down scanning due to more channels
being scanned, but I haven't analysed that yet. Did you measure that?

Also please CC linux-wireless on ath10k patches. Otherwise patchwork
won't see them and it won't be on my radar:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
