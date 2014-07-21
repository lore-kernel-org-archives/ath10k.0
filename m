Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9511-00084j-Cx
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 04:15:56 +0000
Received: by mail-vc0-f169.google.com with SMTP id hu12so11407746vcb.28
 for <ath10k@lists.infradead.org>; Sun, 20 Jul 2014 21:15:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1405689992-8538-3-git-send-email-sw@simonwunderlich.de>
References: <1405689992-8538-1-git-send-email-sw@simonwunderlich.de>
 <1405689992-8538-3-git-send-email-sw@simonwunderlich.de>
Date: Mon, 21 Jul 2014 12:15:33 +0800
Message-ID: <CAEFj986Vruig8wCP+RLS_gQf8utAirmTDCKwmMGyfj7B2vH9pw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: add spectral scan feature
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: mathias.kretschmer@fokus.fraunhofer.de, kgiori@qca.qualcomm.com, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, sven@narfation.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, Jul 18, 2014 at 9:26 PM, Simon Wunderlich <sw@simonwunderlich.de> wrote:
> Adds the spectral scan feature for ath10k. The spectral scan is triggered by
> configuring a mode through a debugfs control file. Samples can be gathered via
> another relay debugfs file.
>
> Essentially, to try it out:
>
> ip link dev wlan0 set up

It should be "ip link set dev wlan0 up", right?

I have tried to capture the samples on ath10k and open it using fft_eval.

But found the following errors in my samples "invalid bin length 63".

I will send the samples in separate email.

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
