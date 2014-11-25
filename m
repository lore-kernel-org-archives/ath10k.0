Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xt68y-0005w0-Mu
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 02:46:21 +0000
Received: by mail-ie0-f177.google.com with SMTP id rd18so10131703iec.36
 for <ath10k@lists.infradead.org>; Mon, 24 Nov 2014 18:45:58 -0800 (PST)
Message-ID: <5473ED63.8070601@gmail.com>
Date: Mon, 24 Nov 2014 21:45:55 -0500
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
Subject: Fix Me in htc.c
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
To: kvalo@qca.qualcomm.com
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linville@tuxdriver.com, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org

Greetings Kalle and John,
I am wondering about what amount we need to reserve for amount of bytes needed for the function, ath10k_htc_build_tx_ctrl_skb in htc.c If one of you can send me the amount of bytes we need to 
reserve for this to function correctly, I will gladly write a patch for this :).
Nick

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
