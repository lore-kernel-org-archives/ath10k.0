Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22e.google.com ([2607:f8b0:400c:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9SAy-0003Vh-7D
 for ath10k@lists.infradead.org; Tue, 22 Jul 2014 04:59:44 +0000
Received: by mail-vc0-f174.google.com with SMTP id la4so13940068vcb.33
 for <ath10k@lists.infradead.org>; Mon, 21 Jul 2014 21:59:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201407211143.04868.sw@simonwunderlich.de>
References: <1405689992-8538-1-git-send-email-sw@simonwunderlich.de>
 <1405689992-8538-3-git-send-email-sw@simonwunderlich.de>
 <CAEFj986Vruig8wCP+RLS_gQf8utAirmTDCKwmMGyfj7B2vH9pw@mail.gmail.com>
 <201407211143.04868.sw@simonwunderlich.de>
Date: Tue, 22 Jul 2014 12:59:20 +0800
Message-ID: <CAEFj9878tYieueZn4fn4EZSgPSTTnoTj4Xb8wu_Es1gHy0KEqQ@mail.gmail.com>
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

Hi, Simon

>
> Thanks for the output! Could it be that you are using the old RFC patch with
> the new fft-eval? I've added another byte (max_exp), so the header became
> longer. Please try again with the latest patch (from this thread), if that is
> the case. Otherwise we have to find out whats wrong ... The sample_len as used
> in fft_eval (tlv-header + data) should be 93 with that version.

Yes, you are right. I am picking out the ath-next-test branch which is
using the RFC old patch before that.

By the way, the new submitted patch v2 [1] has taken out the following:

if (mode == SPECTRAL_BACKGROUND)ath10k_spectral_scan_trigger(ar);


-----
Chun-Yeow

[1] http://lists.infradead.org/pipermail/ath10k/2014-July/002711.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
