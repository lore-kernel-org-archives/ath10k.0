Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifiva-0000F7-L7
 for ath10k@lists.infradead.org; Fri, 13 Dec 2019 11:16:12 +0000
Received: by mail-oi1-x235.google.com with SMTP id v10so715336oiv.12
 for <ath10k@lists.infradead.org>; Fri, 13 Dec 2019 03:16:10 -0800 (PST)
MIME-Version: 1.0
From: Justin Capella <justincapella@gmail.com>
Date: Fri, 13 Dec 2019 03:15:57 -0800
Message-ID: <CAMrEMU9Mz+0RNmmGQHic_cWPf45LHeK3Mzcy6a=GuYkvgdN+RQ@mail.gmail.com>
Subject: qca988x fw crash/unrecoverable pcie errors causes error loop
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
To: ath10k <ath10k@lists.infradead.org>
Cc: linux-wireless@vger.kernel.org

Paste: http://ix.io/24hJ

I think a station went out of range, and somehow that crashed the fw,
but when it tried to recover it was unable to read CE, and so fails to
recover, eventually an correctable PCI error occurred but *80211_ in
an attempt to reconfig is trying to stop all interfaces, which
includes stopping aggregation for the peers...

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
