Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihwxh-0007G1-Q9
 for ath10k@lists.infradead.org; Thu, 19 Dec 2019 14:39:34 +0000
Received: by mail-ot1-x342.google.com with SMTP id b18so7504261otp.0
 for <ath10k@lists.infradead.org>; Thu, 19 Dec 2019 06:39:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <000eaa2a-4798-a855-93a9-c9679b8860c8@newmedia-net.de>
References: <20191216092207.31032-1-john@phrozen.org>
 <20191217153000.76AB1C4479C@smtp.codeaurora.org>
 <CAKR_QVJVfqid8i5PXj3Yg8VJjht=MF2fZg+twkLgEkKuMB2bbQ@mail.gmail.com>
 <CAKR_QVJ1PhCHfAO5Rp6pm-wjAO-HcZiq-9Lw67FzBFO5jjYtbA@mail.gmail.com>
 <d24c7821-4e5e-28b5-5d1d-f076cfd762fc@newmedia-net.de>
 <CAKR_QVLKfoo15EqszGSZ9zf6YnfEkih9=PeB0d92k3i0SJZfxQ@mail.gmail.com>
 <000eaa2a-4798-a855-93a9-c9679b8860c8@newmedia-net.de>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Thu, 19 Dec 2019 15:39:31 +0100
Message-ID: <CAKR_QV+Le2zRvnGz4EiMKtXY8HTzH9eru86n6kN+5A9XSF7y3A@mail.gmail.com>
Subject: Re: [RESEND] ath10k: add tx hw 802.11 encapusaltion offloading support
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
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>

in core.c there is also needed ethernetmode check in
ath10k_core_init_firmware_features

ar->wmi.rx_decap_mode = ATH10K_HW_TXRX_NATIVE_WIFI

replace with

if (ethernetmode)
	ar->wmi.rx_decap_mode = ATH10K_HW_TXRX_ETHERNET
else
	ar->wmi.rx_decap_mode = ATH10K_HW_TXRX_NATIVE_WIFI

QSDK driver sets it like that when using eth mode

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
