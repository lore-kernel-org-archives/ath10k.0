Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drP5b-0006oG-0V
 for ath10k@lists.infradead.org; Mon, 11 Sep 2017 13:49:28 +0000
Received: by mail-wm0-x22b.google.com with SMTP id i189so40227630wmf.1
 for <ath10k@lists.infradead.org>; Mon, 11 Sep 2017 06:49:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKAh8AMVMy-ACgvmJBu4qwDpTGh_AYRXSTEcirEWFCrvc2h7Pg@mail.gmail.com>
References: <CAKAh8AMVMy-ACgvmJBu4qwDpTGh_AYRXSTEcirEWFCrvc2h7Pg@mail.gmail.com>
From: Bartosz Chronowski
 <ext.bartosz.chronowski@qti-qualcomm.corp-partner.google.com>
Date: Mon, 11 Sep 2017 15:49:03 +0200
Message-ID: <CAKAh8ANukMeCt1Zg8OK367LAC1k+BTZBi5+1iBVSOoVNR_6QCA@mail.gmail.com>
Subject: Fwd: QCA6174 fw logs howto
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
To: ath10k@lists.infradead.org
Cc: Bartosz Chronowski <ext.bartosz.chronowski@tieto.com>

Hi everyone,
What are the steps necessary to read QCA6174 firmware logs?

echo 0xffff 0 > /sys/kernel/debug/ieee80211/phy*/ath10k/fw_dbglog
trace-cmd record -e ath10k
trace-cmd report > file

Seems not enought for fw logs. Are hints?

Regards,
BC

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
