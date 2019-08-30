Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3WyY-0007Ci-G5
 for ath10k@lists.infradead.org; Fri, 30 Aug 2019 02:49:26 +0000
Subject: RE: [PATCH v2 3/7] ath10k: add workqueue for RX path of sdio
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Fri, 30 Aug 2019 02:49:14 +0000
Message-ID: <fe3102a7c5324f31afc8151e2a01f7e9@aptaiexm02f.ap.qualcomm.com>
References: <1566903707-27536-1-git-send-email-wgong@codeaurora.org>
 <1566903707-27536-4-git-send-email-wgong@codeaurora.org>
 <CANMq1KDSi_6g2pthZfLqnBrwzAhTcXQtUpmZsR4+EqZgFONnZw@mail.gmail.com>
In-Reply-To: <CANMq1KDSi_6g2pthZfLqnBrwzAhTcXQtUpmZsR4+EqZgFONnZw@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Nicolas Boichat <drinkcat@chromium.org>, Wen Gong <wgong@codeaurora.org>
Cc: "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

-----Original Message-----
From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Nicolas Boichat
Sent: Wednesday, August 28, 2019 1:17 PM
To: Wen Gong <wgong@codeaurora.org>
Cc: open list:NETWORKING DRIVERS (WIRELESS) <linux-wireless@vger.kernel.org>; ath10k@lists.infradead.org
Subject: [EXT] Re: [PATCH v2 3/7] ath10k: add workqueue for RX path of sdio

Changed and V3 sent, https://patchwork.kernel.org/patch/11122163/
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
