Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL3jY-0000hD-S1
 for ath10k@lists.infradead.org; Mon, 29 Apr 2019 10:42:06 +0000
Received: by mail-qk1-x744.google.com with SMTP id m137so5608749qke.3
 for <ath10k@lists.infradead.org>; Mon, 29 Apr 2019 03:42:04 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com.
 [209.85.222.169])
 by smtp.gmail.com with ESMTPSA id z85sm16628533qka.18.2019.04.29.03.42.01
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 03:42:02 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id w20so5584353qka.7
 for <ath10k@lists.infradead.org>; Mon, 29 Apr 2019 03:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <2884043.Jv1Mn93hE8@aspire.rjw.lan>
 <20190403195718.GA74723@google.com>
 <87o94tutdz.fsf@kamboji.qca.qualcomm.com>
 <CAJZ5v0ifD=DATprUeeO2_LGs04aEEhPB6AcGVPxWUdQaOma+ww@mail.gmail.com>
In-Reply-To: <CAJZ5v0ifD=DATprUeeO2_LGs04aEEhPB6AcGVPxWUdQaOma+ww@mail.gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Mon, 29 Apr 2019 18:41:50 +0800
Message-ID: <CALiNf2_qV+iViHbS0tQquTMZfu6XfFvQCH14mdT5bixn94DZ2Q@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Drop WARN_ON()s that always trigger during system
 resume
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
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sriram R <srirrama@codeaurora.org>, Linux PM <linux-pm@vger.kernel.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, ath10k@lists.infradead.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Todd Brandt <todd.e.brandt@intel.com>, Kalle Valo <kvalo@codeaurora.org>

Tested-by: Claire Chang <tientzu@chromium.org>

> Still, I'm quite sure that the WARN_ON()s trigger during system resume
> regardless of the hw/fw combination.

Also see this on sido:

[    4.925278] ath10k_sdio mmc1:0001:1: qca6174 hw3.2 sdio target
0x05030000 chip_id 0x00000000 sub 0000:0000
[    4.935721] ath10k_sdio mmc1:0001:1: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 1
[    4.948750] ath10k_sdio mmc1:0001:1: firmware ver
WLAN.RMH.4.4.1-00007-QCARMSWP-1 api 6 features wowlan,ignore-otp crc32
b98adaf8
[    5.132728] ath10k_sdio mmc1:0001:1: board_file api 2 bmi_id 0:4
crc32 6364cfcc

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
