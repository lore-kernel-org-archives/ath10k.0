Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejtBp-0007qp-O4
 for ath10k@lists.infradead.org; Thu, 08 Feb 2018 20:53:07 +0000
Received: by mail-lf0-x22e.google.com with SMTP id v12so698060lfa.10
 for <ath10k@lists.infradead.org>; Thu, 08 Feb 2018 12:52:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFR5RwRh3W4GFLz3C9PGRCQA-hv40HqtAU-43P17n6pL69aK6w@mail.gmail.com>
References: <CAFR5RwTCNV-135E16fXJLECsart-cTjVJq8QcDB3wKH+JrsHnw@mail.gmail.com>
 <87lgglufls.fsf@kamboji.qca.qualcomm.com>
 <CAFR5RwRh3W4GFLz3C9PGRCQA-hv40HqtAU-43P17n6pL69aK6w@mail.gmail.com>
From: Adam Porter <porter.adam@gmail.com>
Date: Thu, 8 Feb 2018 12:52:50 -0800
Message-ID: <CAFR5RwTLCuWCwfuB3qo6CHDgt3K-FEQrYi=aZrVydhPSPO93_A@mail.gmail.com>
Subject: Re: QCA6174 SDIO crashing after few days
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org

Update to this issue, I can reliably reproduce a crash by using a
USB-Ethernet adapter.

Setup is: (c1) [ iperf client -> ethernet ] -----> (AP) [ usb-ethernet
(wan) -> wifi (lan) ] ----> (c2) [wifi -> iperf server]

This will bring down the module on the AP almost instantaneously.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
