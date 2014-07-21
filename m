Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([2001:4d88:2000:24::c0de]
 helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9A81-00012R-HA
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 09:43:30 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: Re: [PATCH 2/2] ath10k: add spectral scan feature
Date: Mon, 21 Jul 2014 11:43:04 +0200
References: <1405689992-8538-1-git-send-email-sw@simonwunderlich.de>
 <1405689992-8538-3-git-send-email-sw@simonwunderlich.de>
 <CAEFj986Vruig8wCP+RLS_gQf8utAirmTDCKwmMGyfj7B2vH9pw@mail.gmail.com>
In-Reply-To: <CAEFj986Vruig8wCP+RLS_gQf8utAirmTDCKwmMGyfj7B2vH9pw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201407211143.04868.sw@simonwunderlich.de>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: mathias.kretschmer@fokus.fraunhofer.de, kgiori@qca.qualcomm.com, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, sven@narfation.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> On Fri, Jul 18, 2014 at 9:26 PM, Simon Wunderlich <sw@simonwunderlich.de> 
wrote:
> > Adds the spectral scan feature for ath10k. The spectral scan is triggered
> > by configuring a mode through a debugfs control file. Samples can be
> > gathered via another relay debugfs file.
> > 
> > Essentially, to try it out:
> > 
> > ip link dev wlan0 set up
> 
> It should be "ip link set dev wlan0 up", right?

Whoops, yeah, that's right, I'll change that in the next iteration.
> 
> I have tried to capture the samples on ath10k and open it using fft_eval.
> 
> But found the following errors in my samples "invalid bin length 63".
> 
> I will send the samples in separate email.

Thanks for the output! Could it be that you are using the old RFC patch with 
the new fft-eval? I've added another byte (max_exp), so the header became 
longer. Please try again with the latest patch (from this thread), if that is 
the case. Otherwise we have to find out whats wrong ... The sample_len as used 
in fft_eval (tlv-header + data) should be 93 with that version.

Thanks!
    Simon

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
