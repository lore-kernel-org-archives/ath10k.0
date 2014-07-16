Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([2001:4d88:2000:24::c0de]
 helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7KjT-00011i-5V
 for ath10k@lists.infradead.org; Wed, 16 Jul 2014 08:38:36 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: Re: [RFC 0/2] ath10k spectral scan support
Date: Wed, 16 Jul 2014 10:38:09 +0200
References: <1405441966-32681-1-git-send-email-sw@simonwunderlich.de>
 <CA+BoTQmNJuwYpSiXqF8OUuXQULLSdUW+PO4Sz5oNKyaduHMKPg@mail.gmail.com>
 <4111404.UJkIUxkzQm@bentobox>
In-Reply-To: <4111404.UJkIUxkzQm@bentobox>
MIME-Version: 1.0
Message-Id: <201407161038.10130.sw@simonwunderlich.de>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: Mathias Kretschmer <mathias.kretschmer@fokus.fraunhofer.de>, "Giori,
 Kathy" <kgiori@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


> On Wednesday 16 July 2014 08:24:58 Michal Kazior wrote:
> > >  * So far, we always get 64 bins of fft data in the samples, even if we
> > >  
> > >    are in HT40 or VHT80 mode. That doesn't seem right, as there should
> > >    be more bins for wider channels (e.g. 128 or 256 bins). Is there any
> > >    parameter to change in the configuration to get the output from
> > >    multiple channels / higher bandwidth?
> > 
> > Hmm.. I suspect this may be because you use scan command. Scanning
> > uses channel list which is programmed with legacy modes a and g
> > (implying 20Mhz). Perhaps that's the limiting factor now. Using other
> > (wider) modes breaks scan from what I remember but it might be worth
> > checking out if it impacts fft bin sizes.
> 
> I did the HT80 and HT40 stuff on a single channel in the spectral
> "background" mode. They reports from the firmware (10.1) still only had 64
> bins. The HT80 stuff wasn't tested with the "main" firmware because it
> refused to switch to HT80 mode as AP/Sta.

Just to clarify this a little more, we tried AP (running hostapd) as well a 
STA in 40 and 80 MHz modes. We always got 64 bins returned.

Cheers,
    Simon

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
